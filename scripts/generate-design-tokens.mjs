import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const scriptDir = dirname(fileURLToPath(import.meta.url));
const sdkRoot = resolve(scriptDir, "..");
const tokenPath = resolve(sdkRoot, "shared/design-tokens/flare-im.tokens.json");

const tsOut = resolve(
  sdkRoot,
  "packages/vue-im-ui/src/design-system/theme/generated/flare-design-tokens.ts",
);
const cssOut = resolve(
  sdkRoot,
  "packages/vue-im-ui/src/design-system/styles/generated/flare-design-tokens.css",
);
const dartOut = resolve(
  sdkRoot,
  "examples/flare-core-flutter-app/lib/shared/theme/flare_theme_tokens.dart",
);

const checkOnly = process.argv.includes("--check");

function sortObject(value) {
  if (Array.isArray(value)) return value.map(sortObject);
  if (!value || typeof value !== "object") return value;
  return Object.fromEntries(
    Object.entries(value)
      .sort(([a], [b]) => a.localeCompare(b))
      .map(([key, nested]) => [key, sortObject(nested)]),
  );
}

function pxNumber(value) {
  return Number(String(value).replace(/px$/, ""));
}

function resolveRef(tokens, value) {
  if (typeof value !== "string") return value;
  const match = value.match(/^\{(.+)\}$/);
  if (!match) return value;
  return match[1].split(".").reduce((current, key) => current?.[key], tokens);
}

function hexToDartColor(hex) {
  const value = String(hex).trim();
  if (!/^#[0-9A-Fa-f]{6}([0-9A-Fa-f]{2})?$/.test(value)) {
    throw new Error(`Dart token color must be 6 or 8 digit hex: ${value}`);
  }
  if (value.length === 7) return `Color(0xFF${value.slice(1).toUpperCase()})`;
  return `Color(0x${value.slice(1).toUpperCase()})`;
}

function dartColor(tokens, value) {
  return hexToDartColor(resolveRef(tokens, value));
}

function cssVarName(parts) {
  return parts
    .map((part) => String(part).replace(/[A-Z]/g, (char) => `-${char.toLowerCase()}`))
    .join("-");
}

function flattenCss(prefix, value, rows = []) {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    rows.push([cssVarName(prefix), value]);
    return rows;
  }
  for (const [key, nested] of Object.entries(value)) {
    flattenCss([...prefix, key], nested, rows);
  }
  return rows;
}

function generateTs(tokens) {
  const payload = {
    colors: tokens.colors.light,
    sizes: tokens.sizes,
    shadows: tokens.shadows,
    transitions: tokens.transitions,
    composer: tokens.composer,
    dark: {
      colors: tokens.colors.dark,
      composer: tokens.darkComposer,
    },
  };
  return `// GENERATED. Do not edit by hand.

export const flareDesignTokens = ${JSON.stringify(sortObject(payload), null, 2)} as const;
`;
}

function generateCss(tokens) {
  const lightRows = [
    ...flattenCss(["flare", "color"], tokens.colors.light),
    ...flattenCss(["flare", "size"], tokens.sizes),
    ...flattenCss(["flare", "shadow"], tokens.shadows),
    ...flattenCss(["flare", "transition"], tokens.transitions),
  ];
  const darkRows = flattenCss(["flare", "color"], tokens.colors.dark);
  return `/* GENERATED. Do not edit by hand. */
:root {
${lightRows.map(([name, value]) => `  --${name}: ${value};`).join("\n")}
}

[data-flare-theme="dark"] {
${darkRows.map(([name, value]) => `  --${name}: ${value};`).join("\n")}
}
`;
}

function generateDart(tokens) {
  const light = tokens.colors.light;
  const dark = tokens.flutter.darkColors;
  const semantic = tokens.flutter.semanticColors;
  const color = (value) => dartColor(tokens, value);
  const px = (value) => pxNumber(value);
  return `// GENERATED. Do not edit by hand.

import 'package:flutter/material.dart';

abstract final class FlareThemeTokens {
  static const Color primary = ${color(light.primary)};
  static const Color primaryHover = ${color(light.primaryHover)};
  static const Color primaryActive = ${color(light.primaryActive)};

  static const Color success = ${color(light.success)};
  static const Color warning = ${color(light.warning)};
  static const Color error = ${color(light.error)};
  static const Color info = ${color(light.info)};

  static const Color robot = ${color(light.robot)};
  static const Color important = ${color(light.important)};
  static const Color pinned = ${color(light.pinned)};

  static const Color bgPrimary = ${color(light.bg.primary)};
  static const Color bgSecondary = ${color(light.bg.secondary)};
  static const Color bgTertiary = ${color(light.bg.tertiary)};
  static const Color bgHover = ${color(light.bg.hover)};
  static const Color bgSelected = ${color(light.bg.selected)};
  static const Color bgDisabled = ${color(light.bg.disabled)};

  static const Color textPrimary = ${color(light.text.primary)};
  static const Color textSecondary = ${color(light.text.secondary)};
  static const Color textTertiary = ${color(light.text.tertiary)};
  static const Color textDisabled = ${color(light.text.disabled)};
  static const Color textLink = ${color(light.text.link)};
  static const Color textLinkHover = ${color(light.text.linkHover)};

  static const Color borderPrimary = ${color(light.border.primary)};
  static const Color borderSecondary = ${color(light.border.secondary)};
  static const Color borderHover = ${color(light.border.hover)};
  static const Color borderSelected = ${color(light.border.selected)};

  static const Color bubbleSelf = ${color(light.bubble.self)};
  static const Color bubbleOther = ${color(light.bubble.other)};
  static const Color bubbleRobot = ${color(light.bubble.robot)};
  static const Color bubbleSystem = ${color(light.bubble.system)};

  static const Color loginScreenCanvas = ${color(semantic.loginScreenCanvas)};
  static const Color loginLogoBackground = ${color(semantic.loginLogoBackground)};
  static const Color loginLogoAccent = ${color(semantic.loginLogoAccent)};
  static const Color loginCardSurface = ${color(semantic.loginCardSurface)};
  static const Color loginCardBorder = ${color(semantic.loginCardBorder)};
  static const Color loginSubtitle = ${color(semantic.loginSubtitle)};
  static const Color loginHint = ${color(semantic.loginHint)};
  static const Color loginCtaBackground = ${color(semantic.loginCtaBackground)};
  static const Color loginCtaForeground = ${color(semantic.loginCtaForeground)};
  static const Color loginInputBorder = ${color(semantic.loginInputBorder)};
  static const Color loginInputFill = ${color(semantic.loginInputFill)};

  static const double radiusXs = ${px(tokens.sizes.radius.xs)};
  static const double radiusSm = ${px(tokens.sizes.radius.sm)};
  static const double radiusMd = ${px(tokens.sizes.radius.md)};
  static const double radiusLg = ${px(tokens.sizes.radius.lg)};
  static const double radiusXl = ${px(tokens.sizes.radius.xl)};

  static const double spacingXs = ${px(tokens.sizes.spacing.xs)};
  static const double spacingSm = ${px(tokens.sizes.spacing.sm)};
  static const double spacingMd = ${px(tokens.sizes.spacing.md)};
  static const double spacingLg = ${px(tokens.sizes.spacing.lg)};
  static const double spacingXl = ${px(tokens.sizes.spacing.xl)};
  static const double spacing2xl = ${px(tokens.sizes.spacing["2xl"])};

  static const Color conversationListCanvas = ${color(semantic.conversationListCanvas)};
  static const Color conversationListDivider = ${color(semantic.conversationListDivider)};
  static const Color conversationListSearchStroke = ${color(semantic.conversationListSearchStroke)};
  static const Color conversationListPinnedBorder = ${color(semantic.conversationListPinnedBorder)};
  static const Color conversationListPinnedTile = ${color(semantic.conversationListPinnedTile)};
  static const Color conversationListPinnedAvatar = ${color(semantic.conversationListPinnedAvatar)};
  static const Color conversationListItemStroke = ${color(semantic.conversationListItemStroke)};
  static const Color conversationListAvatarFallback = ${color(semantic.conversationListAvatarFallback)};
  static const Color conversationListPinLabel = ${color(semantic.conversationListPinLabel)};
  static const Color conversationListDraftAccent = ${color(semantic.conversationListDraftAccent)};
  static const Color conversationListMentionAccent = ${color(semantic.conversationListMentionAccent)};
  static const Color conversationListQuoteWarning = ${color(semantic.conversationListQuoteWarning)};
  static const Color conversationListOnlineDot = ${color(semantic.conversationListOnlineDot)};
  static const Color conversationListUnreadBadgeBg = ${color(semantic.conversationListUnreadBadgeBg)};
  static const Color conversationListUnreadBadgeFg = ${color(semantic.conversationListUnreadBadgeFg)};

  static const Color composerToolbarIcon = ${color(semantic.composerToolbarIcon)};
  static const Color composerSendBackground = ${color(semantic.composerSendBackground)};
  static const Color composerSendForeground = ${color(semantic.composerSendForeground)};
  static const Color composerSendDisabledBg = ${color(semantic.composerSendDisabledBg)};
  static const Color composerSendDisabledFg = ${color(semantic.composerSendDisabledFg)};
  static const Color composerReplyStripBg = ${color(semantic.composerReplyStripBg)};
  static const Color composerReplyStripBorder = ${color(semantic.composerReplyStripBorder)};
  static const Color composerReplyStripLabel = ${color(semantic.composerReplyStripLabel)};
  static const Color composerReplyStripPreview = ${color(semantic.composerReplyStripPreview)};
  static const Color composerReplyStripClose = ${color(semantic.composerReplyStripClose)};
  static const Color composerReplyStripSep = ${color(semantic.composerReplyStripSep)};

  static const Color messageReadReceipt = ${color(semantic.messageReadReceipt)};
  static const Color messageStatusMuted = ${color(semantic.messageStatusMuted)};
  static const Color messageMediaPlaceholderBg = ${color(semantic.messageMediaPlaceholderBg)};
  static const Color messageVideoPlayOverlay = ${color(semantic.messageVideoPlayOverlay)};

  static const Color chatCanvas = ${color(semantic.chatCanvas)};
  static const Color chatSelfBubbleFill = ${color(semantic.chatSelfBubbleFill)};
  static const Color chatConnectionBannerBg = ${color(semantic.chatConnectionBannerBg)};
  static const Color chatConnectionBannerFg = ${color(semantic.chatConnectionBannerFg)};
}

abstract final class FlareDarkThemeTokens {
  static const Color bgPrimary = ${color(dark.bgPrimary)};
  static const Color bgSecondary = ${color(dark.bgSecondary)};
  static const Color bgTertiary = ${color(dark.bgTertiary)};
  static const Color bgHover = ${color(dark.bgHover)};
  static const Color bgSelected = ${color(dark.bgSelected)};

  static const Color textPrimary = ${color(dark.textPrimary)};
  static const Color textSecondary = ${color(dark.textSecondary)};
  static const Color textTertiary = ${color(dark.textTertiary)};
  static const Color textLink = ${color(dark.textLink)};

  static const Color borderPrimary = ${color(dark.borderPrimary)};
  static const Color borderSecondary = ${color(dark.borderSecondary)};
  static const Color borderSelected = ${color(dark.borderSelected)};

  static const Color bubbleSelf = ${color(dark.bubbleSelf)};
  static const Color bubbleOther = ${color(dark.bubbleOther)};
  static const Color bubbleRobot = ${color(dark.bubbleRobot)};
}
`;
}

async function writeGenerated(path, content) {
  if (checkOnly) {
    const current = await readFile(path, "utf8");
    if (current !== content) {
      throw new Error(`${path.replace(`${sdkRoot}/`, "")} is out of date; run node scripts/generate-design-tokens.mjs`);
    }
    return;
  }
  await mkdir(dirname(path), { recursive: true });
  await writeFile(path, content);
}

const tokens = JSON.parse(await readFile(tokenPath, "utf8"));
await writeGenerated(tsOut, generateTs(tokens));
await writeGenerated(cssOut, generateCss(tokens));
await writeGenerated(dartOut, generateDart(tokens));

console.log(checkOnly ? "Design token artifacts are up to date." : "Design token artifacts generated.");
