import fs from "node:fs";
import path from "node:path";

import { describe, expect, it, vi } from "vitest";

import {
  DefaultEventsApi,
  eventTypeForWebChannel,
  nativeEventFromCode,
} from "../src/adapter/module/DefaultEventsApi";
import type { NativeBridge } from "../src/contract/bridge_contract";
import {
  CapabilityEventName,
  ConversationType,
  ConversationEventName,
  ConnectionEventName,
  MessageEventName,
  MessageContentType,
  SdkConnectionState,
  TimelineSyncState,
} from "../src/model";

const eventGoldenDir = path.resolve(
  process.cwd(),
  "../../sdk-spec/golden/events",
);

function readEventGolden(name: string): Record<string, unknown> {
  return JSON.parse(
    fs.readFileSync(path.join(eventGoldenDir, name), "utf8"),
  ) as Record<string, unknown>;
}

function webEventType(channel: string): number {
  const eventType = eventTypeForWebChannel(channel);
  if (eventType === undefined) {
    throw new Error(`missing web event channel mapping: ${channel}`);
  }
  return eventType;
}

function testBridge(): NativeBridge {
  return {
    invoke: vi.fn(async () => ({ subscriptionId: "test-subscription" })),
  };
}

describe("DefaultEventsApi direct event callbacks", () => {
  it("dispatches connection state_changed to the matching typed callback only", () => {
    const events = new DefaultEventsApi(testBridge());
    const ready: string[] = [];
    const connected: string[] = [];
    const disconnected: string[] = [];

    events.onConnectReady((event) => ready.push(event.state));
    events.onConnectSuccess((event) => connected.push(event.state));
    events.onDisconnected((event) => disconnected.push(event.state));

    events.emitNativeEvent(1004, { state: "Ready" });
    events.emitNativeEvent(1004, { state: "Connected" });

    expect(ready).toEqual([SdkConnectionState.Ready]);
    expect(connected).toEqual([SdkConnectionState.Connected]);
    expect(disconnected).toEqual([]);
  });

  it("dispatches message mutation callbacks by concrete event name", () => {
    const events = new DefaultEventsApi(testBridge());
    const recalled: string[] = [];
    const edited: string[] = [];

    events.onMessageRecalled((event) => recalled.push(event.name));
    events.onMessageEdited((event) => edited.push(event.name));

    events.emitNativeEvent(2005, {
      conversationId: "c1",
      serverMsgId: "m1",
    });
    events.emitNativeEvent(2008, {
      conversationId: "c1",
      serverMsgId: "m1",
    });
    events.emitNativeEvent(2010, {
      conversationId: "c1",
      serverMsgId: "m1",
    });

    expect(recalled).toEqual([MessageEventName.Recalled]);
    expect(edited).toEqual([MessageEventName.Edited]);
  });

  it("maps core connection state strings to strict event names", () => {
    const events = new DefaultEventsApi(testBridge());
    const names: string[] = [];

    events.onConnecting((event) => names.push(event.name));
    events.onConnectReady((event) => names.push(event.name));
    events.onReconnecting((event) => names.push(event.name));

    events.emitNativeEvent(1004, { state: "Connecting" });
    events.emitNativeEvent(1004, { state: "Ready" });
    events.emitNativeEvent(1004, { state: "Reconnecting" });

    expect(names).toEqual([
      ConnectionEventName.Connecting,
      ConnectionEventName.Ready,
      ConnectionEventName.Reconnecting,
    ]);
  });

  it("keeps unknown native event codes as raw forward-compatible events", () => {
    expect(nativeEventFromCode(999_999, { value: 1 })).toEqual({
      type: "unknown",
      name: "unknown",
      event: "unknown",
      eventType: 999_999,
      payload: { value: 1 },
    });
  });

  it("isolates listener failures and continues fan-out", () => {
    const events = new DefaultEventsApi(testBridge());
    const received: string[] = [];
    const consoleError = vi.spyOn(console, "error").mockImplementation(() => {});

    try {
      events.onConnectReady(() => {
        throw new Error("listener broke");
      });
      events.onConnectReady((event) => received.push(event.state));

      events.emitNativeEvent(1004, { state: "Ready" });

      expect(received).toEqual([SdkConnectionState.Ready]);
      expect(consoleError).toHaveBeenCalledWith(
        "[flare-core] event listener failed",
        expect.any(Error),
      );
    } finally {
      consoleError.mockRestore();
    }
  });

  it("rejects message batch events without the required messages array", () => {
    expect(() => nativeEventFromCode(2002, {})).toThrow(
      "invalid event payload field: messages",
    );
  });

  it("decodes message batch golden from the Web push channel into the typed listener", () => {
    const events = new DefaultEventsApi(testBridge());
    const batches: number[] = [];
    const singles: string[] = [];

    events.onMessageReceivedBatch((event) => batches.push(event.messages.length));
    events.onMessageReceived((event) => singles.push(event.message.serverId));

    events.emitNativeEvent(
      webEventType("im://message_batch"),
      readEventGolden("message_received_batch.json"),
    );

    expect(batches).toEqual([2]);
    expect(singles).toEqual([]);

    const decoded = nativeEventFromCode(
      webEventType("im://message_batch"),
      readEventGolden("message_received_batch.json"),
    );

    expect(decoded).toMatchObject({
      type: "message",
      event: MessageEventName.ReceivedBatch,
      messages: [
        {
          conversationId: "group-100",
          conversationSeq: 100,
          content: { contentType: MessageContentType.Text },
        },
        {
          conversationId: "group-100",
          conversationSeq: 101,
          content: { contentType: MessageContentType.Text },
        },
      ],
    });
  });

  it("rejects typing events with missing or non-boolean protocol fields", () => {
    expect(() =>
      nativeEventFromCode(2006, {
        conversationId: "c1",
        userId: "u1",
      }),
    ).toThrow("invalid event payload field: typing");

    expect(() =>
      nativeEventFromCode(2006, {
        conversationId: "c1",
        userId: "u1",
        typing: "true",
      }),
    ).toThrow("invalid event payload field: typing");
  });

  it("decodes typing aggregate and read receipt goldens into collaboration listeners", () => {
    const events = new DefaultEventsApi(testBridge());
    const typing: string[] = [];
    const typingAggregates: string[] = [];
    const reads: number[] = [];

    events.onInputStatusChanged((event) => {
      typing.push(`${event.conversationId}:${event.userId}:${event.typing}`);
    });
    events.onTypingAggregateChanged((event) => {
      typingAggregates.push(
        `${event.conversationId}:${event.typingCount}:${event.typingUserIds.join(",")}`,
      );
    });
    events.onMessageReadReceipt((event) => reads.push(event.readSeq));

    events.emitNativeEvent(
      webEventType("im://typing"),
      readEventGolden("typing.json"),
    );
    events.emitNativeEvent(
      webEventType("im://message_typing_aggregate"),
      readEventGolden("typing_aggregate.json"),
    );
    events.emitNativeEvent(
      webEventType("im://message_read_receipt"),
      readEventGolden("read_receipt.json"),
    );

    expect(typing).toEqual(["group-100:user-a:true"]);
    expect(typingAggregates).toEqual(["group-100:2:user-a,user-b"]);
    expect(reads).toEqual([101]);

    expect(nativeEventFromCode(
      webEventType("im://message_typing_aggregate"),
      readEventGolden("typing_aggregate.json"),
    )).toMatchObject({
      type: "message",
      event: MessageEventName.TypingAggregate,
      name: MessageEventName.TypingAggregate,
      conversationId: "group-100",
      typingUserIds: ["user-a", "user-b"],
      typingCount: 2,
    });
  });

  it("rejects read receipt events unless readSeq is a finite number", () => {
    expect(() =>
      nativeEventFromCode(2011, {
        conversationId: "c1",
        userId: "u1",
        readSeq: "7",
      }),
    ).toThrow("invalid event payload field: readSeq");

    const event = nativeEventFromCode(2011, {
      conversationId: "c1",
      userId: "u1",
      readSeq: 7,
    }) as { readSeq: number };

    expect(event.readSeq).toBe(7);
  });

  it("decodes unread-count conversation goldens into conversation refresh listeners", () => {
    const events = new DefaultEventsApi(testBridge());
    const unreadCounts: number[] = [];
    const changedConversationIds: string[][] = [];

    events.onTotalUnreadMessageCountChanged((event) => {
      unreadCounts.push(event.unreadCount ?? -1);
    });
    events.onConversationChanged((event) => {
      changedConversationIds.push(event.conversationIds);
    });

    events.emitNativeEvent(
      webEventType("im://unread_count_changed"),
      readEventGolden("conversation_unread_count_changed.json"),
    );

    expect(unreadCounts).toEqual([2]);
    expect(changedConversationIds).toEqual([["group-100"]]);

    const decoded = nativeEventFromCode(
      webEventType("im://unread_count_changed"),
      readEventGolden("conversation_unread_count_changed.json"),
    );

    expect(decoded).toMatchObject({
      type: "conversation",
      event: "unread_count_changed",
      name: ConversationEventName.UnreadCountChanged,
      conversationId: "group-100",
      conversationIds: ["group-100"],
      unreadCount: 2,
    });
  });

  it("decodes conversation snapshot and view delta goldens into view listeners", () => {
    const events = new DefaultEventsApi(testBridge());
    const updates: Array<{
      kind: string;
      viewType: string;
      totalUnread: number | null;
      syncState: string | null;
      firstConversationId: string | null;
      opCount: number;
      firstDeltaKey: string | null;
    }> = [];

    events.onViewUpdated((event) => {
      const snapshotData = event.snapshot?.data as {
        conversations?: Array<{ conversationId: string }>;
        totalUnread?: number;
        syncState?: string;
      } | undefined;
      updates.push({
        kind: event.kind,
        viewType: event.snapshot?.viewType ?? event.delta?.viewType ?? "",
        totalUnread: snapshotData?.totalUnread ?? event.delta?.totalUnread ?? null,
        syncState: snapshotData?.syncState ?? event.delta?.syncState ?? null,
        firstConversationId:
          snapshotData?.conversations?.[0]?.conversationId ??
          event.delta?.conversation?.conversationId ??
          null,
        opCount: event.delta?.ops.length ?? 0,
        firstDeltaKey: event.delta?.ops[0]?.key ?? null,
      });
    });

    events.emitNativeEvent(
      webEventType("im://view_updated"),
      readEventGolden("conversation_snapshot.json"),
    );
    events.emitNativeEvent(
      webEventType("im://view_updated"),
      readEventGolden("view_update_delta.json"),
    );

    expect(updates).toEqual([
      {
        kind: "snapshot",
        viewType: "conversationList",
        totalUnread: 2,
        syncState: TimelineSyncState.Synced,
        firstConversationId: "group-100",
        opCount: 0,
        firstDeltaKey: null,
      },
      {
        kind: "delta",
        viewType: "timeline",
        totalUnread: null,
        syncState: null,
        firstConversationId: null,
        opCount: 1,
        firstDeltaKey: "client:cm1",
      },
    ]);

    const decodedSnapshot = nativeEventFromCode(
      webEventType("im://view_updated"),
      readEventGolden("conversation_snapshot.json"),
    );
    const decodedDelta = nativeEventFromCode(
      webEventType("im://view_updated"),
      readEventGolden("view_update_delta.json"),
    );

    expect(decodedSnapshot).toMatchObject({
      type: "view",
      event: "updated",
      kind: "snapshot",
      snapshot: {
        viewType: "conversationList",
        data: {
          totalUnread: 2,
          syncState: TimelineSyncState.Synced,
          conversations: [
            {
              conversationId: "group-100",
              conversationType: ConversationType.Group,
              maxSeq: 101,
            },
          ],
        },
      },
    });
    expect(decodedDelta).toMatchObject({
      type: "view",
      event: "updated",
      kind: "delta",
      delta: {
        viewType: "timeline",
        hasMore: false,
        ops: [
          {
            op: "insert",
            key: "client:cm1",
            index: 0,
          },
        ],
      },
    });
  });

  it("rejects malformed send-failed and reaction events instead of filling defaults", () => {
    expect(() =>
      nativeEventFromCode(2004, {
        clientMsgId: "",
        reason: "timeout",
      }),
    ).toThrow("invalid event payload field: clientMsgId");

    expect(() =>
      nativeEventFromCode(2009, {
        conversationId: "c1",
        serverMsgId: "m1",
        userId: "u1",
        emoji: "👍",
        action: "1",
      }),
    ).toThrow("invalid event payload field: action");
  });

  it("decodes capability unavailable golden into the capability listener", () => {
    const events = new DefaultEventsApi(testBridge());
    const unavailable: string[] = [];

    events.onCapabilityChanged((event) => {
      unavailable.push(`${event.name}:${event.capability}:${event.reason}`);
    });

    events.emitNativeEvent(
      webEventType("im://extension"),
      readEventGolden("capability_unavailable.json"),
    );

    expect(unavailable).toEqual(["unavailable:sfu.call:plugin_disabled"]);

    const decoded = nativeEventFromCode(
      webEventType("im://extension"),
      readEventGolden("capability_unavailable.json"),
    );

    expect(decoded).toMatchObject({
      type: "capability",
      event: CapabilityEventName.Unavailable,
      name: CapabilityEventName.Unavailable,
      capability: "sfu.call",
      reason: "plugin_disabled",
    });
  });

  it("decodes SDK error payloads without filling missing code or message", () => {
    const failed = nativeEventFromCode(
      webEventType("im://send_failed"),
      readEventGolden("send_failed_with_error.json"),
    ) as {
      error?: {
        code: string;
        message: string;
        operation?: string;
        retryable?: boolean;
        details: Record<string, string>;
      };
    };

    expect(failed.error).toEqual({
      code: "timeout",
      message: "message send timed out before durable acknowledgement",
      operation: "message.send",
      retryable: true,
      details: {
        phase: "durable_ack",
        conversationId: "group-100",
      },
    });

    const event = nativeEventFromCode(2004, {
      clientMsgId: "cm1",
      reason: "timeout",
      error: {
        code: "timeout",
        message: "send timed out",
        operation: "message.send",
        retryable: true,
        details: { phase: "flush" },
      },
    }) as { error?: { code: string; message: string; details: Record<string, string> } };

    expect(event.error?.code).toBe("timeout");
    expect(event.error?.message).toBe("send timed out");
    expect(event.error?.details).toEqual({ phase: "flush" });

    expect(() =>
      nativeEventFromCode(2004, {
        clientMsgId: "cm1",
        reason: "timeout",
        error: { code: "timeout" },
      }),
    ).toThrow("invalid event payload field: error.message");

    const stringError = nativeEventFromCode(2004, {
      clientMsgId: "cm1",
      reason: "timeout",
      error: "timeout",
    }) as { reason: string; error?: unknown };

    expect(stringError.reason).toBe("timeout");
    expect(stringError.error).toBeUndefined();

    const syncStringError = nativeEventFromCode(4003, {
      task: "single_conversation",
      error: "sync forward: user settings version conflict or participant not found",
    }) as { message?: string; error?: unknown };

    expect(syncStringError.message).toBe(
      "sync forward: user settings version conflict or participant not found",
    );
    expect(syncStringError.error).toBeUndefined();

    expect(() =>
      nativeEventFromCode(2004, {
        clientMsgId: "cm1",
        reason: "timeout",
        error: 3,
      }),
    ).toThrow("invalid event payload field: error");

    expect(() =>
      nativeEventFromCode(2004, {
        clientMsgId: "cm1",
        reason: "timeout",
        error: {
          code: "timeout",
          message: "send timed out",
          details: { retryAfter: 3 },
        },
      }),
    ).toThrow("invalid event payload field: error.details.retryAfter");
  });
});
