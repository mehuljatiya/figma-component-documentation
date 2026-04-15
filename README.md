# figma-component-documentation

A Claude Code skill (`/document-component`) that generates developer-ready component documentation from a Figma design system URL.

## What it does

1. Fetches design context from a Figma component URL
2. Writes a structured `.md` documentation file
3. Generates a self-contained `.html` preview (sticky sidebar, Do/Don't cards, color swatches, token values)
4. Opens the preview in your browser
5. Optionally pushes the documentation layout into the Figma design file as a frame on the same page as the component

## Installation

Copy `document-component.md` into your Claude Code commands directory:

```bash
cp document-component.md ~/.claude/commands/document-component.md
```

You'll also need the [Figma MCP server](https://github.com/anthropics/claude-code) configured:

```bash
claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user
```

## Usage

In Claude Code, run:

```
/document-component https://www.figma.com/design/<fileKey>/<name>?node-id=<nodeId>
```

Pass a Figma URL pointing to the component or documentation page you want to document.

## Output

| File | Description |
|---|---|
| `[component-name].md` | Structured markdown — Introduction, Anatomy, Variations, Props & Tokens, Usage Guidelines, Accessibility, Platform, Related Components |
| `[component-name].html` | Self-contained HTML preview with sticky sidebar nav, Do/Don't cards, inline color swatches |

## Documentation sections

- **Introduction** — what the component is, types, and key behaviours
- **Anatomy** — structural parts with ASCII diagram and table
- **Variations** — Type, Size, Boolean Props, States (only states defined in Figma)
- **Props & Tokens** — prop table, design tokens per variant, size tokens, typography
- **Usage Guidelines** — When to use, When not to use, Do/Don't pairs
- **Accessibility** — Keyboard interactions, ARIA attributes, focus behavior, screen reader notes
- **Platform** — Desktop, Tablet, Mobile behaviour
- **Related Components** — components that work alongside or instead of this one

## Push to Figma

After generating the docs, Claude will ask if you want to push them into Figma. If yes, it places a documentation frame directly on the same page as the shared component — no new page is created.

The frame uses the Figma Plugin API (`use_figma`) and includes component visual samples at key sections (Introduction, Variations, Platform).

## Design system compatibility

Built for the **Cashmere Design System** (Cashfree) but the structure follows industry-standard patterns (Atlassian, Carbon, Polaris, Material) and works with any Figma design system.

Token pattern: `--sds-[category]-[property]-[modifier]`

## Requirements

- [Claude Code](https://claude.ai/code)
- Figma MCP server configured (OAuth, no personal token needed)
- Figma file open in desktop app or browser with plugin access for the push step
