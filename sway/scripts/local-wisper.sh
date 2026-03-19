#!/usr/bin/env bash
set -euo pipefail

LW_BIN="${LW_BIN:-$(command -v lw || true)}"
LW_MODEL="${LW_MODEL:-small}"
LW_COMPUTE_TYPE="${LW_COMPUTE_TYPE:-int8}"
LW_DEVICE="${LW_DEVICE:-cpu}"
LW_SAMPLE_RATE="${LW_SAMPLE_RATE:-16000}"
LW_VAD_FILTER="${LW_VAD_FILTER:-false}"
LW_OUTPUT_MODE="${LW_OUTPUT_MODE:-type}"

if [[ -z "${LW_BIN}" ]]; then
  if command -v notify-send >/dev/null 2>&1; then
    notify-send echo "local wisper: 'lw' is not in PATH, intall it from https://github.com/none23/local-wisper"
  fi
  echo "local wisper: 'lw' is not in PATH, intall it from https://github.com/none23/local-wisper" >&2
  exit 1
fi

args=(
  --model "${LW_MODEL}"
  --compute-type "${LW_COMPUTE_TYPE}"
  --device "${LW_DEVICE}"
  --sample-rate "${LW_SAMPLE_RATE}"
)

if [[ "${LW_VAD_FILTER}" == "true" ]]; then
  args+=(--vad-filter)
else
  args+=(--no-vad-filter)
fi

case "${1:-}" in
  sway-stop|sway-toggle)
    if [[ "${LW_OUTPUT_MODE}" == "type" ]]; then
      args+=(--type-output)
    fi
    ;;
esac

exec "${LW_BIN}" "${args[@]}" "$@"
