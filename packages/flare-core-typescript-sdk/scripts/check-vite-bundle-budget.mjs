#!/usr/bin/env node
import { readdirSync, statSync } from "node:fs";
import path from "node:path";

const distDir = path.resolve(process.argv[2] ?? "dist");
const maxKiB = Number.parseFloat(process.argv[3] ?? "500");

if (!Number.isFinite(maxKiB) || maxKiB <= 0) {
  console.error(`Invalid bundle budget: ${process.argv[3]}`);
  process.exit(2);
}

const assetsDir = path.join(distDir, "assets");
const maxBytes = maxKiB * 1024;
const offenders = [];

for (const fileName of readdirSync(assetsDir)) {
  if (!fileName.endsWith(".js")) continue;
  const filePath = path.join(assetsDir, fileName);
  const size = statSync(filePath).size;
  if (size > maxBytes) {
    offenders.push({ fileName, size });
  }
}

if (offenders.length > 0) {
  console.error(`Vite JS bundle budget exceeded (${maxKiB} KiB):`);
  for (const offender of offenders.sort((a, b) => b.size - a.size)) {
    console.error(`- ${offender.fileName}: ${(offender.size / 1024).toFixed(2)} KiB`);
  }
  process.exit(1);
}

console.log(`Vite JS bundle budget OK: all chunks <= ${maxKiB} KiB`);
