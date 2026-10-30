import { describe, expect, it } from "vitest";
import { pluginViewExtras } from "./view";

describe("resolved design-kit presentation", () => {
  const presentation = {
    renderer: "payment.confirm",
    props: { amount: "999999999999999999.99", currency: "CNY" },
    actions: { confirm: "pay" },
  };

  it("preserves exact display values and declared callback IDs", () => {
    expect(pluginViewExtras({ available: true, presentation }).presentation).toEqual(presentation);
  });

  it("never exposes a custom renderer for unavailable views", () => {
    expect(pluginViewExtras({ available: false, presentation }).presentation).toBeUndefined();
    expect(pluginViewExtras({ presentation }).presentation).toBeUndefined();
  });
});
