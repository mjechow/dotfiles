#!/usr/bin/env bash
# PreToolUse hook: block reads/edits/commands targeting secret files.
# Claude Code passes the tool call as JSON on stdin.
# Exit 2 = block the tool call.

input=$(cat)
path=$(echo "$input" | jq -r '.tool_input.file_path // .tool_input.command // ""')

# Match anywhere in a command, not only at its end; `*.example` templates stay readable.
if echo "$path" | grep -qP 'secret\.backup|(pwd\.env|\.secret|\.key)(?![\w.-])'; then
    echo "Blocked: secret file access not allowed: $path" >&2
    exit 2
fi

exit 0
