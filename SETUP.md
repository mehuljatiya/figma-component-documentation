# Setup Guide

This guide walks you through everything you need to start generating component documentation from Figma. It takes about 15 minutes.

**What you'll install:**
- Claude Code — the AI assistant
- Figma MCP — lets Claude read and write to Figma
- Chrome DevTools plugin — lets Claude control your browser
- figma-friend plugin — Figma-specific browser automation

---

## Before you begin

You need an **Anthropic account** to use Claude Code. Sign up at [claude.ai](https://claude.ai) — a Pro plan ($20/month) gives you access to Claude Code. You'll be prompted to log in during Step 1.

---

## Step 1 — Install Claude Code

Claude Code is the AI tool that runs this skill. It works in your terminal (the Terminal app on Mac).

1. Make sure you have **Node.js 18 or higher** installed. To check, open Terminal and run:
   ```
   node --version
   ```
   If you see `v18` or higher (e.g. `v20.11.0`), you're good. If not — or if you get "command not found" — download and install the LTS version from [nodejs.org](https://nodejs.org).

2. Install Claude Code:
   ```
   npm install -g @anthropic-ai/claude-code
   ```

3. Start Claude Code:
   ```
   claude
   ```

4. On first launch it will ask you to log in. Follow the prompt — it opens a browser window where you sign in with your Anthropic account.

> **Tip:** Claude Code also has a desktop app if you prefer not to use the terminal. Download it from [claude.ai/download](https://claude.ai/download).

---

## Step 2 — Add the Figma MCP server

This lets Claude read your Figma files and write documentation frames back into them.

1. Open a **new Terminal window** (Cmd+T in Terminal, or Cmd+N) so Claude Code stays running in the first one.

2. Run:
   ```
   claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user
   ```

3. Go back to Claude Code and restart it:
   ```
   claude
   ```

4. Once Claude Code is open, type `/mcp` and press Enter. You should see **figma** in the list.

5. Select figma, then choose **Authenticate**. A browser window opens — log in with your Figma account. You only do this once.

---

## Step 3 — Install the Chrome DevTools plugin

This lets Claude open and control Chrome when pushing documentation into Figma.

Inside Claude Code, run:

```
/plugin install chrome-devtools-mcp@chrome-devtools-plugins
```

When it completes, run `/plugin list` to confirm `chrome-devtools-mcp` appears.

---

## Step 4 — Install figma-friend

figma-friend gives Claude deeper control over the Figma canvas inside the browser.

Two commands — run both inside Claude Code:

```
/plugin marketplace add https://github.com/markacianfrani/claude-code-figma.git
```

```
/plugin install figma-friend@figma-friend-marketplace
```

Run `/plugin list` to confirm `figma-friend` appears.

> **To update figma-friend later:** `/plugin update figma-friend`

---

## Step 5 — Install the skill

Run this in Terminal (outside Claude Code):

```bash
curl -fsSL -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```

This saves the skill file to the right place. Claude Code picks it up automatically.

To verify: inside Claude Code, type `/doc` — you should see `/document-component` appear as a suggestion.

---

## Step 6 — Use it

1. Open your Figma file, right-click on any component, and choose **Copy link**

2. In Claude Code, type:
   ```
   /document-component YOUR_FIGMA_LINK
   ```

3. Claude will:
   - Read the component from Figma
   - Write the documentation
   - Open an HTML preview in your browser
   - Ask if you want to push the docs into your Figma file

> **Where are the files saved?** In whichever folder you were in when you opened Terminal. To save to a specific place, navigate there first: `cd ~/Desktop` then run `claude`.

---

## Quick check — everything installed?

Run these inside Claude Code to verify:

```
/mcp
```
You should see **figma** listed as connected.

```
/plugin list
```
You should see both **chrome-devtools-mcp** and **figma-friend** listed.

---

## Troubleshooting

**"command not found: claude"**
Close Terminal, reopen it, and try again. If it still fails, reinstall Node.js from [nodejs.org](https://nodejs.org) and run `npm install -g @anthropic-ai/claude-code` again.

**"Figma not connected" or design context not loading**
Run `/mcp` inside Claude Code. If figma isn't listed, re-run the `claude mcp add` command from Step 2, then restart Claude Code and authenticate again.

**Push to Figma fails or Claude can't control the browser**
Run `/plugin list` and check both `chrome-devtools-mcp` and `figma-friend` appear. If either is missing, re-run the install command from Step 3 or 4. Make sure Chrome is installed on your machine.

**The skill doesn't appear when I type `/doc`**
Check the file exists:
```bash
ls ~/.claude/commands/
```
You should see `document-component.md`. If not, re-run the `curl` command from Step 5.

**Figma authentication fails**
Make sure you're logged into Figma in your browser first, then re-run `/mcp` inside Claude Code and try Authenticate again.

---

## Updating the skill

To get the latest version:

```bash
curl -fsSL -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```
