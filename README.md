# Claude Skill Template

A template for building Claude Code skills based on Anthropic's internal playbook.

## Quick Start

1. Clone this repo
2. Rename `skill-name.md` to your skill name
3. Update the description in the YAML frontmatter (write it like a trigger condition, not documentation)
4. Fill in the instructions and gotchas
5. Add your API references to `references/`
6. Add helper scripts to `scripts/`
7. Add templates and assets to `assets/`
8. Configure `config.json` with your setup parameters

## Folder Structure

```
skill-name/
├── skill-name.md      # Main skill file with YAML frontmatter
├── references/        # API docs, function signatures, examples
├── scripts/           # Helper scripts Claude can run
├── assets/            # Templates, config files, brand assets
├── config.json        # Setup info (endpoints, defaults)
└── README.md          # This file
```

## Key Principles from Anthropic

**Skills are folders, not files.** The most interesting skills use folder structure creatively.

**The description field is for Claude, not for you.** Write trigger conditions, not documentation.

**Progressive disclosure.** Do not dump everything into one file. Claude reads what it needs when it needs it.

**Build gotchas over time.** The highest-signal content in any skill is the list of specific failure modes.

**Store scripts, not instructions.** Give Claude composable code so it spends turns on decisions.

## The 9 Skill Categories

1. Library & API Reference
2. Product Verification
3. Data Fetching & Analysis
4. Business Process & Team Automation
5. Code Scaffolding & Templates
6. Code Quality & Review
7. CI/CD & Deployment
8. Runbooks
9. Infrastructure Operations

Full breakdown: [Anthropic Skills Blog Post]

## Credits

Template based on Anthropic's internal skills playbook (March 2026).
Summarized by Justin Holmes (gtmpath.com).
