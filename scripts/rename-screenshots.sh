#!/bin/bash
#
# Bulk-rename simulator screenshots dragged into public/screenshots/.
# Reads files in modification-time order (oldest first) and renames them
# to the canonical marketing names. Run after dragging all 11 screenshots
# into the folder in the listed order.
#
# Drag order (one per row):
#   1.  install-jobs-list.png
#   2.  install-job-detail.png
#   3.  install-notifications.png
#   4.  install-ops-dashboard.png
#   5.  install-payroll.png
#   6.  sales-commissions.png
#   7.  sales-goals.png
#   8.  sales-admin-dashboard.png
#   9.  sales-invites.png
#   10. sales-recruits.png
#   11. sales-create-invite.png
#
# Re-runnable: skips files already renamed (anything not starting with
# "simulator_screenshot_" or "Screenshot").

set -e

DEST="/Users/luminatestudios/Documents/threesixfive-marketing/public/screenshots"

NAMES=(
  "install-jobs-list.png"
  "install-job-detail.png"
  "install-notifications.png"
  "install-ops-dashboard.png"
  "install-payroll.png"
  "sales-commissions.png"
  "sales-goals.png"
  "sales-admin-dashboard.png"
  "sales-invites.png"
  "sales-recruits.png"
  "sales-create-invite.png"
)

cd "$DEST"

# Collect raw simulator/screenshot files sorted by mtime (oldest first).
RAW_FILES=()
while IFS= read -r f; do
  RAW_FILES+=("$f")
done < <(ls -tr 2>/dev/null | grep -E '^(simulator_screenshot_|Screenshot )' || true)

if [ ${#RAW_FILES[@]} -eq 0 ]; then
  echo "No simulator/screenshot files found in:"
  echo "  $DEST"
  echo ""
  echo "Drag your 11 screenshots from the Simulator into that folder first,"
  echo "in this order:"
  for i in "${!NAMES[@]}"; do
    printf "  %2d. %s\n" $((i+1)) "${NAMES[$i]}"
  done
  exit 1
fi

echo "Found ${#RAW_FILES[@]} raw screenshot(s). Expected ${#NAMES[@]}."
echo ""

if [ ${#RAW_FILES[@]} -ne ${#NAMES[@]} ]; then
  echo "WARNING: count mismatch. Will rename the first ${#RAW_FILES[@]} in order."
  echo ""
fi

# Rename in order. Stop when we run out of either list.
COUNT=$(( ${#RAW_FILES[@]} < ${#NAMES[@]} ? ${#RAW_FILES[@]} : ${#NAMES[@]} ))

for ((i=0; i<COUNT; i++)); do
  SRC="${RAW_FILES[$i]}"
  DST="${NAMES[$i]}"
  if [ -e "$DST" ]; then
    echo "  ⚠️  $DST already exists — skipping $SRC"
    continue
  fi
  mv "$SRC" "$DST"
  printf "  ✓ %-50s → %s\n" "$SRC" "$DST"
done

echo ""
echo "Done. Files now in $DEST:"
ls -1
