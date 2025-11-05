#!/usr/bin/env bash
set -euo pipefail

# Source config file if it exists
if [[ -f "${CLEANUP_CONFIG:-}" ]]; then
  source "$CLEANUP_CONFIG"
fi

usage() {
  cat <<'USAGE'
Usage: cleanup-images.sh [-c <config-file>] [-p <directory>] [-f <pattern>] [-r <days>] [--dry-run]

Options:
  -c  Config file path (sources environment variables).
  -p  Directory containing image files. Defaults to $CLEANUP_IMAGE_DIR.
  -f  Glob pattern for filenames. Defaults to $CLEANUP_IMAGE_PATTERN.
  -r  Retention window in days. Files older than this are removed. Defaults to $CLEANUP_RETENTION_DAYS.
  --dry-run  Preview deletions without removing files.
  -h, --help  Show this help.
Environment variables:
  CLEANUP_IMAGE_DIR
  CLEANUP_IMAGE_PATTERN
  CLEANUP_RETENTION_DAYS
  LOG_FILE (optional)
Examples:
  cleanup-images.sh -c cleanup-images.conf
  cleanup-images.sh -p /var/backups -f "fidelity-linux-*.img" -r 30 --dry-run
USAGE
}

log_msg() {
  local msg="$1"
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $msg"
  if [[ -n "${LOG_FILE:-}" ]]; then
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $msg" >> "$LOG_FILE"
  fi
}

ensure_integer() {
  local value="$1"
  [[ "$value" =~ ^[0-9]+$ ]] || { echo "Retention must be a non-negative integer. Received: $value" >&2; exit 2; }
}

main() {
  local directory="${CLEANUP_IMAGE_DIR:-}"
  local pattern="${CLEANUP_IMAGE_PATTERN:-}"
  local retention="${CLEANUP_RETENTION_DAYS:-}"
  local dry_run=0

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -c) source "$2"; shift 2 ;;
      -p) directory="$2"; shift 2 ;;
      -f) pattern="$2"; shift 2 ;;
      -r) retention="$2"; shift 2 ;;
      --dry-run) dry_run=1; shift ;;
      -h|--help) usage; exit 0 ;;
      *) echo "Unknown option: $1" >&2; usage; exit 2 ;;
    esac
  done

  [[ -n "$directory" ]] || { echo "Directory is required." >&2; usage; exit 2; }
  [[ -n "$pattern" ]] || { echo "Filename pattern is required." >&2; usage; exit 2; }
  [[ -n "$retention" ]] || { echo "Retention window is required." >&2; usage; exit 2; }
  ensure_integer "$retention"
  [[ -d "$directory" ]] || { echo "Directory not found: $directory" >&2; exit 1; }

  log_msg "Scanning '$directory' for files matching '$pattern' older than $retention day(s)..."
  mapfile -t matches < <(find "$directory" -type f -name "$pattern" -mtime "+$retention" -print)

  if [[ ${#matches[@]} -eq 0 ]]; then
    log_msg "No files to delete."
    exit 0
  fi

  local deleted_count=0
  for file in "${matches[@]}"; do
    if (( dry_run )); then
      log_msg "[DRY-RUN] Would delete: $file"
    else
      log_msg "Deleting: $file"
      rm -f -- "$file"
      ((deleted_count++))
    fi
  done

  if (( dry_run )); then
    log_msg "Dry run complete. Would delete $((${#matches[@]})) file(s)."
  else
    log_msg "Cleanup complete. Deleted $deleted_count file(s)."
  fi
}

main "$@"