#!/bin/bash
# Source: Anthropic internal skills playbook
# Gist: https://gist.github.com/ThariqS/24defad423d701746e23dc19aace4de5
#
# This hook logs every skill invocation so you can measure
# which skills are popular and which are undertriggering.
#
# Setup: Add to ~/.claude/settings.json:
# {
#   "hooks": {
#     "PreToolUse": [{
#       "matcher": "Skill",
#       "hooks": [{ "type": "command", "command": "~/.claude/hooks/log-skill.sh" }]
#     }]
#   }
# }
#
# Output: ~/.claude/skill-usage.log
# Format: <unix_timestamp> <user> <skill_name> <args>

payload=$(cat)

skill=$(jq -r '.tool_input.skill' <<< "$payload")
args=$(jq -r '.tool_input.args // ""' <<< "$payload")

echo "$(date -u +%s) $USER $skill $args" >> ~/.claude/skill-usage.log
