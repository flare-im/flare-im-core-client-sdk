#!/usr/bin/env bash
# Clone the reference apps that live in their own repositories into examples/.
#
#   bash examples/bootstrap-external-apps.sh              # every app in EXTERNAL-APPS.json
#   bash examples/bootstrap-external-apps.sh web tauri    # a subset, by short name or full dir
#
# Existing checkouts are left untouched. Set BRANCH to prefer a branch of the
# same name in each app repo (falls back to the default branch), as CI does.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
manifest="$here/EXTERNAL-APPS.json"
branch="${BRANCH:-}"

if ! command -v node >/dev/null 2>&1; then
  echo "node is required to read $manifest" >&2
  exit 2
fi

# dir<TAB>repo per line
entries="$(node -e '
  const m = JSON.parse(require("fs").readFileSync(process.argv[1], "utf8"));
  for (const a of m.apps) process.stdout.write(`${a.dir}\t${a.repo}\n`);
' "$manifest")"

wanted=()
for arg in "$@"; do
  case "$arg" in
    flare-core-*-app) wanted+=("$arg") ;;
    *) wanted+=("flare-core-${arg}-app") ;;
  esac
done

selected() {
  [ "${#wanted[@]}" -eq 0 ] && return 0
  local d
  for d in "${wanted[@]}"; do [ "$d" = "$1" ] && return 0; done
  return 1
}

status=0
while IFS=$'\t' read -r dir repo; do
  [ -n "$dir" ] || continue
  selected "$dir" || continue
  dest="$here/$dir"
  if [ -e "$dest/.git" ]; then
    echo "keep  $dir (already a checkout)"
    continue
  fi
  if [ -e "$dest" ] && [ -n "$(ls -A "$dest" 2>/dev/null)" ]; then
    echo "skip  $dir (directory exists and is not a git checkout)" >&2
    status=1
    continue
  fi
  echo "clone $dir <- $repo"
  if [ -n "$branch" ] && git clone --depth 1 -b "$branch" "$repo" "$dest" 2>/dev/null; then
    continue
  fi
  git clone --depth 1 "$repo" "$dest" || status=1
done <<< "$entries"

for d in "${wanted[@]}"; do
  if ! grep -q "^$d	" <<< "$entries"; then
    echo "unknown app: $d (see $manifest)" >&2
    status=1
  fi
done

exit $status
