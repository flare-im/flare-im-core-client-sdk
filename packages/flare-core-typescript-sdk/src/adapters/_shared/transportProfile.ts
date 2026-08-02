/**
 * Single authority for what transport + storage a given runtime can physically
 * deliver. The transport racing algorithm and storage engine live in the Rust core;
 * this only declares the *capability envelope* per runtime so the client (UI) never
 * advertises a transport the runtime cannot honor (e.g. QUIC in a browser/WASM host).
 *
 * Capability (this profile) is orthogonal to availability: a desktop runtime that
 * *supports* QUIC may still be unavailable (native binding not built) — the host gates
 * availability separately and only offers QUIC when both hold.
 *
 * See docs/design/transport-storage-multiruntime.md.
 */

export type RuntimeTransport = "websocket" | "quic";
export type RuntimeStorage = "indexeddb" | "sqlite";

export type RuntimeKind =
  | "browser-wasm"
  | "uni-h5"
  | "electron-native"
  | "tauri-native"
  | "uni-native"
  | "react-native";

export interface TransportProfile {
  runtime: RuntimeKind;
  /** Transports this runtime can physically use. */
  transports: RuntimeTransport[];
  /** Preferred transport when multiple are available. */
  defaultTransport: RuntimeTransport;
  /** Protocol-race order handed to the core (empty = no racing). */
  raceOrder: RuntimeTransport[];
  /** Local persistence engine for this runtime. */
  storage: RuntimeStorage;
  /** Whether the native core runs in-process (vs. WASM host). */
  native: boolean;
}

function nativeProfile(runtime: RuntimeKind): TransportProfile {
  return {
    runtime,
    transports: ["quic", "websocket"],
    defaultTransport: "quic",
    raceOrder: ["quic", "websocket"],
    storage: "sqlite",
    native: true,
  };
}

function webProfile(runtime: RuntimeKind): TransportProfile {
  return {
    runtime,
    transports: ["websocket"],
    defaultTransport: "websocket",
    raceOrder: [],
    storage: "indexeddb",
    native: false,
  };
}

export const TRANSPORT_PROFILES: Record<RuntimeKind, TransportProfile> = {
  "browser-wasm": webProfile("browser-wasm"),
  "uni-h5": webProfile("uni-h5"),
  "electron-native": nativeProfile("electron-native"),
  "tauri-native": nativeProfile("tauri-native"),
  "uni-native": nativeProfile("uni-native"),
  "react-native": nativeProfile("react-native"),
};

export function transportProfileFor(runtime: RuntimeKind): TransportProfile {
  return TRANSPORT_PROFILES[runtime] ?? TRANSPORT_PROFILES["browser-wasm"];
}

/** Whether QUIC / protocol racing can be offered in this runtime's profile. */
export function profileSupportsQuic(profile: TransportProfile): boolean {
  return profile.transports.includes("quic");
}
