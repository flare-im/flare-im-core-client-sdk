// @vitest-environment happy-dom
import { afterEach, describe, expect, it } from "vitest";
import { mount } from "@vue/test-utils";
import { defineComponent, h, nextTick, reactive, type Component } from "vue";
import { registerFlareMessages, useFlareI18nProvider } from "@flare-im/vue-ui/i18n";
import AuthScreen from "./AuthScreen.vue";
import { flareMessages as referenceMessages } from "../../i18n/legacyMessages";

// The auth copy (`login.*`) is reference-app copy, registered at bootstrap by
// configureReferenceApp; the test registers it the same way.
for (const [locale, tree] of Object.entries(referenceMessages)) registerFlareMessages(locale, tree);

const hosts: ReturnType<typeof mount>[] = [];

function setup(overrides: Record<string, unknown> = {}, count = 1) {
  const props = reactive({
    userId: "",
    wsUrl: "wss://example.com/ws",
    httpUrl: "https://example.com/api",
    dataUrl: "file:///test",
    tenantId: "0",
    ...overrides,
  });
  const host = mount(defineComponent({ setup() {
    useFlareI18nProvider("en-US");
    return () => h("div", Array.from({ length: count }, () => h(AuthScreen as Component, props)));
  } }), { attachTo: document.body });
  hosts.push(host);
  return { props, screen: host.findComponent(AuthScreen), screens: host.findAllComponents(AuthScreen) };
}

afterEach(() => {
  hosts.splice(0).forEach(host => host.unmount());
  document.body.innerHTML = "";
  localStorage.clear();
});

describe("shared authentication screen", () => {
  it("keeps the technology artwork decorative without rendering simulated messages", () => {
    const { screen } = setup();
    expect(screen.get(".auth-brand__visual").attributes("aria-hidden")).toBe("true");
    expect(screen.get(".auth-brand__visual img").attributes("alt")).toBe("");
    expect(screen.get(".auth-brand__visual img").attributes("src")).toContain("auth-technology.webp");
    expect(screen.findAll(".message-bubble")).toHaveLength(0);
    expect(screen.findAll("form")).toHaveLength(1);
    expect(screen.emitted("login")).toBeUndefined();
  });

  it("labels the identity field and gives login priority over optional connection settings", () => {
    const { screen } = setup();
    expect(screen.get("h1").text()).toBe("flare IM");
    expect(screen.get("h2").text()).toBe("Welcome back");
    const input = screen.get(".auth-user-input input");
    expect(input.attributes("aria-label")).toBe("User ID");
    expect(document.getElementById(input.attributes("aria-describedby") ?? "")?.textContent?.toLowerCase()).toContain("user id");
    const login = screen.get(".auth-login-btn").element;
    const settings = screen.get(".auth-server-toggle").element;
    expect(login.compareDocumentPosition(settings) & Node.DOCUMENT_POSITION_FOLLOWING).toBeTruthy();
    expect(screen.get(".auth-server-toggle").attributes("aria-expanded")).toBe("false");
  });

  it("blocks empty and whitespace submissions, then submits a valid identity", async () => {
    const { screen, props } = setup();
    expect(screen.get(".auth-login-btn").attributes("disabled")).toBeDefined();
    await screen.get("form").trigger("submit");
    props.userId = "   ";
    await nextTick();
    await screen.get("form").trigger("submit");
    expect(screen.emitted("login")).toBeUndefined();
    props.userId = "auth-test-user";
    await nextTick();
    expect(screen.get(".auth-login-btn").attributes("disabled")).toBeUndefined();
    await screen.get("form").trigger("submit");
    expect(screen.emitted("login")).toHaveLength(1);
  });

  it("prevents duplicate submission while busy and allows retry without clearing the identity", async () => {
    const { screen, props } = setup({ userId: "auth-test-user", loading: true });
    expect(screen.get("form").attributes("aria-busy")).toBe("true");
    await screen.get("form").trigger("submit");
    expect(screen.emitted("login")).toBeUndefined();
    Object.assign(props, { loading: false });
    await nextTick();
    expect((screen.get(".auth-user-input input").element as HTMLInputElement).value).toBe("auth-test-user");
    await screen.get("form").trigger("submit");
    expect(screen.emitted("login")).toHaveLength(1);
  });

  it("retains host-owned identity and gateway updates with only the requested fields", async () => {
    const { screen, props } = setup({ serverFields: ["websocket", "http"], hideToken: true });
    await screen.get(".auth-user-input input").setValue("alice");
    expect(screen.emitted("update:userId")?.[0]).toEqual(["alice"]);
    await screen.get(".auth-server-toggle").trigger("click");
    expect(screen.findAll(".auth-server-fields input")).toHaveLength(2);
    const wsInput = screen.get('input[aria-label="WebSocket gateway URL"]');
    await wsInput.setValue("wss://another.example/ws");
    expect(screen.emitted("update:wsUrl")?.[0]).toEqual(["wss://another.example/ws"]);
    props.wsUrl = "wss://another.example/ws";
    await screen.get(".auth-server-toggle").trigger("click");
    await screen.get(".auth-server-toggle").trigger("click");
    expect((screen.get('input[aria-label="WebSocket gateway URL"]').element as HTMLInputElement).value).toBe(props.wsUrl);
  });

  it("keeps the full connection contract available to other hosts", () => {
    const { screen } = setup({ advancedOpen: true });
    expect(screen.get(".auth-server-toggle").attributes("aria-expanded")).toBe("true");
    expect(screen.findAll(".auth-server-fields input")).toHaveLength(5);
    expect(screen.get('input[aria-label="Token"]').attributes("type")).toBe("password");
  });

  it("uses distinct accessible references when multiple screens are mounted", () => {
    const { screens: [first, second] } = setup({}, 2);
    expect(first.get("h2").attributes("id")).not.toBe(second.get("h2").attributes("id"));
    expect(first.get(".auth-user-input input").attributes("aria-describedby"))
      .not.toBe(second.get(".auth-user-input input").attributes("aria-describedby"));
  });
});
