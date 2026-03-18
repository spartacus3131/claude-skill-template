---
name: weekly-recap
description: "Use when the user asks to generate a weekly recap, summarize what shipped this week, prepare for standup, or review the week's work. Also trigger on 'what did we ship', 'weekly update', or 'prep my recap'."
---

# Weekly Recap Generator

## What This Skill Does

Generates a formatted weekly recap by aggregating merged PRs, closed tickets, and deployment activity. Outputs a Slack-ready summary.

## Instructions

1. Read config.json for GitHub org, repo list, and Slack format preferences
2. Use the GitHub CLI to pull merged PRs from the last 7 days
3. Group by repo and categorize (feature, fix, chore)
4. Check references/format-guide.md for the team's preferred recap structure
5. Generate the recap in Slack-ready markdown
6. If previous recaps exist in data/recaps.log, note what changed since last week

## Gotchas

- GitHub CLI must be authenticated (run `gh auth status` first)
- Some repos use squash merges so PR titles are the commit messages. Others use merge commits so you need to read the PR body.
- Do not include dependabot or automated PRs unless explicitly asked
- Time zones matter. "This week" means Monday 00:00 to Friday 23:59 in the user's local timezone, not UTC.

## Output Format

```
Weekly Recap: [date range]

[Repo Name]
- [Category] PR title (author)
- [Category] PR title (author)

[Repo Name]
- [Category] PR title (author)

Highlights: [1-2 sentence summary of the most impactful changes]
```
