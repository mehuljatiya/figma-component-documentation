# figma-component-documentation

A Claude Code skill that turns any Figma component into a full documentation page — markdown file, HTML preview, and an optional Figma frame — in under a minute.

**Built for designers.** No coding required.

---

## What you get

Paste a Figma link. Claude reads the component, writes the docs, and opens a preview in your browser.

Every doc includes:
- Introduction and anatomy
- All variants, sizes, boolean props, and states
- Design tokens and typography specs
- Usage guidelines with Do / Don't examples
- Accessibility (keyboard, ARIA, screen reader)
- Platform behaviour (Desktop / Tablet / Mobile)
- Related components

Optionally, Claude pushes a formatted documentation frame directly into your Figma file — on the same page as the component.

---

## Before you start

You need an **Anthropic account** (Claude Pro, $20/month) and four tools installed:

| Tool | What it does |
|---|---|
| **Claude Code** | The AI assistant that runs the skill |
| **Figma MCP** | Lets Claude read your Figma files and write documentation frames back into them |
| **Chrome DevTools plugin** | Lets Claude open and navigate Figma in your browser (needed for the push step) |
| **figma-friend plugin** | Adds Figma-specific browser controls on top of Chrome DevTools |

→ Follow the [Setup Guide](SETUP.md) for step-by-step instructions (no coding experience needed).

---

## Install the skill

Once Claude Code is set up, run this one command in your terminal:

```bash
curl -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```

That's it. The skill is now available in every Claude Code session.

---

## How to use it

1. Open Claude Code (`claude` in terminal, or the desktop app)
2. Copy a link to any component in your Figma file
3. Type:

```
/document-component YOUR_FIGMA_LINK
```

Claude will generate the docs, open an HTML preview in your browser, and ask if you want to push it into Figma.

### Example

```
/document-component https://www.figma.com/design/YOURFILEID/DesignSystem?node-id=123-456
```

The link needs to point to a specific component — the URL must contain `node-id=`. Right-click any component in Figma → **Copy link** to get the right URL.

---

## Output files

Two files are saved in the folder you were in when you opened Terminal (usually your home folder). To save to a specific place, `cd` into it before running `claude`.

| File | What it is |
|---|---|
| `[component-name].md` | Clean markdown — ready to paste into Notion, Confluence, or any docs tool |
| `[component-name].html` | Standalone preview with sidebar navigation, Do/Don't cards, and token swatches — just open in any browser |

---

## Pushing to Figma

After the preview opens, Claude will ask:

> "Would you like to push it into the Figma design file?"

Say yes and Claude places a documentation frame on the same page as your component — no new pages created, no manual copying.

---

## Need help?

- [Setup Guide](SETUP.md) — step-by-step installation from scratch
- [Report an issue](https://github.com/mehuljatiya/figma-component-documentation/issues)
