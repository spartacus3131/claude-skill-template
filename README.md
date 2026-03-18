# Claude Code Skill Template

A template for building Claude Code skills based on Anthropic's internal playbook. Anthropic has hundreds of skills in active use. This repo captures their key patterns so you can build skills that actually work.

## Quick Start

1. Clone this repo
2. Copy the `skill-name.md` template and rename it
3. Write the description as a trigger condition (not documentation)
4. Fill in instructions and start a gotchas section
5. Add references, scripts, and assets as needed
6. Configure `config.json` with your setup parameters

Or start from the working example in `examples/weekly-recap/`.

## Folder Structure

```
skill-name/
├── skill-name.md      # Main skill file with YAML frontmatter
├── references/        # API docs, function signatures, examples
├── scripts/           # Helper scripts Claude can run
├── assets/            # Templates, config files, brand assets
├── config.json        # Setup info (endpoints, defaults)
└── README.md
```

## Key Principles from Anthropic

**Skills are folders, not files.** "A common misconception is that skills are just markdown files. They are folders that can include scripts, assets, data that the agent can discover, explore and manipulate."

**The description field is for Claude, not for you.** Claude scans descriptions to decide what to invoke. Write trigger conditions, not documentation. Bad: "helps with data analysis." Good: "Use when the user asks about signup funnel conversion or cohort retention comparisons."

**Context engineering through file structure.** Do not dump everything into one file. Put context in one file, examples in another, edge cases in a third. Claude reads the right one at the right time. You are designing what the model sees and when it sees it.

**Build gotchas over time.** The highest-signal content in any skill is the list of specific failure modes Claude hits repeatedly. A few targeted gotchas outperform pages of documentation.

**Store scripts, not instructions.** Give Claude composable code so it spends turns on decisions, not reconstructing boilerplate.

## The 9 Skill Categories

1. **Library & API Reference** - How to correctly use a library, CLI, or SDK
2. **Product Verification** - Test and verify that code or processes work correctly
3. **Data Fetching & Analysis** - Connect to data sources and pull insights
4. **Business Process & Team Automation** - Automate repetitive workflows into one command
5. **Code Scaffolding & Templates** - Generate boilerplate for common patterns
6. **Code Quality & Review** - Enforce standards and review work before it ships
7. **CI/CD & Deployment** - Fetch, push, deploy, and monitor releases
8. **Runbooks** - Investigate symptoms and produce structured reports
9. **Infrastructure Operations** - Routine maintenance with guardrails for destructive actions

## Measuring Skill Usage

Anthropic tracks which skills are popular and which are undertriggering using a PreToolUse hook. See `measurement/` for the setup:

- `measurement/hooks/log-skill.sh` - The hook script (from Anthropic's Thariq Shaq)
- `measurement/README.md` - Setup instructions and analysis queries

Source: https://gist.github.com/ThariqS/24defad423d701746e23dc19aace4de5

## Example: Weekly Recap Skill

See `examples/weekly-recap/` for a complete working skill that aggregates merged PRs, closed tickets, and deployment activity into a Slack-ready weekly summary. Demonstrates:

- Trigger-style description in YAML frontmatter
- Config-driven setup (repos, Slack channel, excluded authors)
- Reference files for formatting rules
- Real gotchas from production use

## Resources

- [Anthropic Skills Blog Post](https://www.anthropic.com) - The full internal playbook
- [Claude Code Skills Documentation](https://docs.anthropic.com/en/docs/claude-code/skills)
- [Skill Usage Tracking Hook](https://gist.github.com/ThariqS/24defad423d701746e23dc19aace4de5)

## Credits

Template based on Anthropic's internal skills playbook (March 2026).
Summarized by Justin Holmes (gtmpath.com).
