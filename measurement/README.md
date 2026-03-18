# Measuring Skill Usage

Anthropic uses a PreToolUse hook to log skill usage across their company. This lets them find skills that are popular and skills that are undertriggering compared to expectations.

## Setup

1. Copy `hooks/log-skill.sh` to `~/.claude/hooks/log-skill.sh`
2. Add the hook configuration to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [{
      "matcher": "Skill",
      "hooks": [{ "type": "command", "command": "~/.claude/hooks/log-skill.sh" }]
    }]
  }
}
```

3. Every skill invocation now logs to `~/.claude/skill-usage.log`

## Reading the Log

Each line is: `<unix_timestamp> <user> <skill_name> <args>`

Quick analysis:

```bash
# Most used skills
awk '{print $3}' ~/.claude/skill-usage.log | sort | uniq -c | sort -rn

# Usage by day
awk '{print strftime("%Y-%m-%d", $1), $3}' ~/.claude/skill-usage.log | sort | uniq -c | sort -rn

# Skills not used in the last 7 days (potentially undertriggering)
comm -23 \
  <(ls .claude/skills/ | sort) \
  <(awk -v cutoff=$(date -v-7d +%s) '$1 > cutoff {print $3}' ~/.claude/skill-usage.log | sort -u)
```

## Source

Hook by Thariq Shaq (Claude Code team at Anthropic):
https://gist.github.com/ThariqS/24defad423d701746e23dc19aace4de5
