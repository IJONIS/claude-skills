#!/usr/bin/env bash
# SessionStart hook for ijonis-skills plugin
# Injects agent-triage instructions with live agent registry

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Read the triage skill content
skill_content=$(cat "${PLUGIN_ROOT}/skills/agent-triage/SKILL.md" 2>&1 \
  || echo "Error reading agent-triage skill")

# Build agent registry table from the ijonis-agents marketplace
agent_table="| Agent | Description | Subagent Type |\n|-------|-------------|---------------|"

AGENTS_DIR="${HOME}/.claude/plugins/marketplaces/ijonis-agents/.claude-plugin"
if [ -f "${AGENTS_DIR}/marketplace.json" ]; then
  while IFS= read -r line; do
    name=$(echo "$line" | cut -d'|' -f1)
    desc=$(echo "$line" | cut -d'|' -f2)
    agent_table="${agent_table}\n| ${name} | ${desc} | ${name}:${name} |"
  done < <(
    python3 -c "
import json, sys
with open('${AGENTS_DIR}/marketplace.json') as f:
    data = json.load(f)
for p in data.get('plugins', []):
    print(f\"{p['name']}|{p['description']}\")
"
  )
fi

# Replace placeholder with actual registry
skill_content="${skill_content/\{\{AGENT_REGISTRY\}\}/$agent_table}"

# Escape for JSON (same pattern as superpowers plugin)
escape_for_json() {
    local input="$1"
    local output=""
    local i char
    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
        case "$char" in
            $'\\') output+='\\' ;;
            '"') output+='\"' ;;
            $'\n') output+='\n' ;;
            $'\r') output+='\r' ;;
            $'\t') output+='\t' ;;
            *) output+="$char" ;;
        esac
    done
    printf '%s' "$output"
}

escaped_content=$(escape_for_json "$skill_content")

cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "<EXTREMELY_IMPORTANT>\nAgent Triage Protocol (Priority 0 — before all other skills)\n\n${escaped_content}\n</EXTREMELY_IMPORTANT>"
  }
}
EOF

exit 0
