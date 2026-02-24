# IJONIS Claude Code Skills

Shared [Claude Code](https://docs.anthropic.com/en/docs/claude-code) plugin bundling reusable skills for the IJONIS team.

## Skills Included

| Skill | Description |
|-------|-------------|
| **content-creator** | SEO-optimized content creation with brand voice analysis, content frameworks, social media templates, and keyword research workflows. |
| **agent-browser** | Browser automation via [agent-browser](https://github.com/nicobailey/agent-browser) — navigation, form filling, screenshots, session management, and data extraction. |

## Installation

### 1. Add the marketplace

```bash
/plugin marketplace add IJONIS/claude-skills
```

### 2. Install the plugin

```bash
/plugin install ijonis-skills@ijonis-marketplace
```

Or install interactively:

```bash
/plugin
# Navigate to "Discover" tab → select ijonis-skills
```

### 3. Use the skills

Skills are auto-invoked by Claude when relevant, or invoke manually:

```
/ijonis-skills:content-creator
/ijonis-skills:agent-browser
```

## Project-Specific Extensions

This plugin provides **generic, cross-project** skills. Individual repositories can extend them with project-specific configuration by adding a local skill (e.g., `.claude/skills/content-config/SKILL.md`) that defines:

- Content schemas and frontmatter fields
- Available components (MDX, React, etc.)
- File naming conventions
- Build tools and linter commands
- Brand identity and voice specifics
- Category taxonomies
- Bilingual/i18n rules

## Updating

Pull the latest version:

```bash
/plugin update ijonis-skills@ijonis-marketplace
```

## Structure

```
claude-skills/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest
│   └── marketplace.json     # Marketplace manifest
├── skills/
│   ├── content-creator/     # Content creation skill
│   │   ├── SKILL.md
│   │   ├── assets/
│   │   ├── references/
│   │   └── scripts/
│   └── agent-browser/       # Browser automation skill
│       ├── SKILL.md
│       ├── references/
│       └── templates/
├── LICENSE
└── README.md
```

## License

MIT
