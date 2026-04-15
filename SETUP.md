# Setup Guide

This guide walks you through everything you need to start generating component documentation from Figma. It should take about 10 minutes.

---

## Step 1 — Install Claude Code

Claude Code is the AI tool that runs this skill. It works in your terminal.

1. Make sure you have **Node.js** installed. To check, open Terminal and run:
   ```
   node --version
   ```
   If you see a version number (e.g. `v20.11.0`), you're good. If not, download it from [nodejs.org](https://nodejs.org) and install the LTS version.

2. Install Claude Code:
   ```
   npm install -g @anthropic-ai/claude-code
   ```

3. Start Claude Code:
   ```
   claude
   ```

4. On first launch, it will ask you to log in with your Anthropic account. Follow the prompts — it opens a browser window to sign in.

---

## Step 2 — Add the Figma MCP server

This lets Claude read your Figma files.

1. Inside Claude Code, run:
   ```
   /mcp
   ```

2. If Figma is not listed, add it by running this in your terminal (outside Claude):
   ```
   claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user
   ```

3. Restart Claude Code (`claude`), then run `/mcp` again. You should see **figma** listed.

4. Select figma → **Authenticate** and follow the browser login. You only do this once.

---

## Step 3 — Install the skill

Run this one command in Terminal:

```bash
curl -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```

This downloads the skill file into the right place. Claude Code picks it up automatically — no restart needed.

To verify it's installed, start Claude Code and type `/doc` — you should see `/document-component` appear as a suggestion.

---

## Step 4 — Use it

1. Open your Figma file and copy the link to a component (right-click on the component → Copy link)

2. In Claude Code, type:
   ```
   /document-component YOUR_FIGMA_LINK
   ```

3. Claude will:
   - Read the component from Figma
   - Write the documentation
   - Open an HTML preview in your browser
   - Ask if you want to push the docs into your Figma file

---

## Troubleshooting

**"command not found: claude"**
Node.js wasn't installed correctly, or the install path isn't in your PATH. Try closing Terminal, reopening it, and running `claude` again. If it still fails, reinstall Node.js from [nodejs.org](https://nodejs.org).

**"Figma not connected" or no design context returned**
Run `/mcp` inside Claude Code and check that Figma shows as connected. If not, re-run the `claude mcp add` command from Step 2 and authenticate again.

**Claude says it can't read the Figma file**
Make sure the Figma link is to a specific component or frame (the URL should contain `node-id=`). Links to the file root won't work as well. Also ensure you have at least view access to the file.

**The skill doesn't appear when I type `/doc`**
Check that the file was saved in the right place:
```bash
ls ~/.claude/commands/
```
You should see `document-component.md` listed. If not, re-run the `curl` command from Step 3.

---

## Updating the skill

To get the latest version, just re-run the install command:

```bash
curl -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```
