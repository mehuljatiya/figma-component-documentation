# Setup Guide

This guide walks you through everything you need to start generating component documentation from Figma. It takes about 15–20 minutes.

> **Mac only.** This guide covers macOS. Windows support is not documented yet.

---

## Before you begin

You need:
- A **Mac** running macOS
- An **Anthropic account** — sign up free at [claude.ai](https://claude.ai). Claude Code requires a **Pro plan ($20/month)**.
- A **Figma account** — you already have this if you use Figma

---

## A note before you start: two places you'll type commands

This guide will ask you to type commands in two different places. It's important to know the difference:

**Terminal** — a plain text window on your Mac where you run system commands. It looks like this:
```
your-mac:~ yourname$
```

**Claude Code** — an AI chat interface that also runs *inside* Terminal. It looks like this:
```
> Type a message or /command...
```

Some steps say "run in Terminal" and others say "run inside Claude Code." They look similar but they're different. The guide will always tell you which one.

---

## Step 0 — How to open Terminal

If you've never opened Terminal before:

1. Press **Cmd + Space** to open Spotlight search
2. Type **Terminal**
3. Press **Enter**

A window opens with a blinking cursor. That's Terminal. Every command in this guide gets typed here and confirmed with **Enter**.

---

## Step 1 — Install Claude Code

**Option A — Desktop app (easier, recommended for designers)**

Download the Claude Code desktop app from [claude.ai/download](https://claude.ai/download). Install it like any Mac app. Open it and sign in with your Anthropic account.

Once the app is open, skip to **Step 2**.

---

**Option B — Terminal install**

1. First, check if Node.js is installed. In Terminal, type:
   ```
   node --version
   ```
   - If you see a version number like `v20.11.0` — you're good, continue to step 2
   - If you see `command not found` — download Node.js from [nodejs.org](https://nodejs.org), install the **LTS** version, then **close and reopen Terminal** before continuing

2. Install Claude Code:
   ```
   npm install -g @anthropic-ai/claude-code
   ```

   > **If you see a red "permission denied" error:** Run this instead:
   > ```
   > sudo npm install -g @anthropic-ai/claude-code
   > ```
   > It will ask for your Mac login password. Type it (nothing appears as you type — that's normal) and press Enter.

3. Start Claude Code:
   ```
   claude
   ```

4. It will ask you to log in with your Anthropic account. Follow the prompt — a browser window opens.

   You are now **inside Claude Code**. The prompt changes to look like a chat interface. Steps 3 and 4 will be typed here.

---

## Step 2 — Add the Figma MCP server

This lets Claude read your Figma files and write documentation frames back into them.

**If you're using the desktop app:**
Open Settings inside the app, find the MCP or Integrations section, and add Figma using the URL `https://mcp.figma.com/mcp`. Then authenticate with your Figma account.

**If you're using Terminal:**

1. You're currently inside Claude Code. Press **Ctrl+C** to exit back to the regular Terminal prompt.

   You'll know you're back in Terminal when the prompt looks like:
   ```
   your-mac:~ yourname$
   ```

2. Run this command:
   ```
   claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user
   ```

3. Start Claude Code again:
   ```
   claude
   ```

4. Type `/mcp` and press Enter. A list of connected services appears. Use the **arrow keys** to select **figma**, then press Enter. Choose **Authenticate**, press Enter. A browser window opens — log in with your Figma account.

   You only do this once.

---

## Step 3 — Install the Chrome DevTools plugin

This lets Claude open and control Chrome when pushing documentation into Figma.

> Make sure **Google Chrome** is installed on your Mac. If not, download it from [google.com/chrome](https://google.com/chrome).

You should be **inside Claude Code** now. Type this command and press Enter:

```
/plugin install chrome-devtools-mcp@chrome-devtools-plugins
```

Wait for it to finish — you'll see a confirmation message. Then verify it worked:

```
/plugin list
```

You should see `chrome-devtools-mcp` in the list.

---

## Step 4 — Install figma-friend

figma-friend gives Claude deeper control over the Figma canvas inside the browser.

Still **inside Claude Code**, run these two commands one at a time. Wait for each one to finish before running the next:

**Command 1:**
```
/plugin marketplace add https://github.com/markacianfrani/claude-code-figma.git
```

Wait for the confirmation message, then run:

**Command 2:**
```
/plugin install figma-friend@figma-friend-marketplace
```

Verify it worked:
```
/plugin list
```

You should see `figma-friend` in the list.

> **To update figma-friend later:** `/plugin update figma-friend`

---

## Step 5 — Install the skill

Now you need to go back to regular Terminal (not inside Claude Code).

**If you're using Terminal:** Press **Ctrl+C** to exit Claude Code. The prompt changes back to the regular Terminal view.

**If you're using the desktop app:** Open Terminal (Cmd+Space → "Terminal").

Run this command:

```
curl -fsSL -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```

> `~` is shorthand for your home folder (e.g. `/Users/yourname`). The command saves the skill file to `~/.claude/commands/` which is where Claude Code looks for custom skills.

**Verify it installed:** Go back into Claude Code and type `/doc` — you should see `/document-component` appear as a suggestion.

---

## Step 6 — Use it

1. Open your Figma file. Find the component you want to document.
   - **In the Figma desktop app:** Right-click the component → **Copy/Paste as** → **Copy link**
   - **In the Figma web app:** Right-click the component → **Copy link to selection**

2. Go into Claude Code and type:
   ```
   /document-component YOUR_FIGMA_LINK
   ```
   Replace `YOUR_FIGMA_LINK` with the link you copied.

3. Claude will:
   - Read the component from Figma
   - Write the documentation
   - Open an HTML preview in your browser
   - Ask if you want to push the docs into your Figma file

> **Where are the files saved?** They are saved in your home folder by default (that's `/Users/yourname` — the same folder you see when you open Finder and click your name in the sidebar). To save them somewhere specific like your Desktop, press Ctrl+C to exit Claude Code, type `cd ~/Desktop`, then start Claude Code again with `claude`.

---

## Quick check — is everything set up?

Inside Claude Code, run:

```
/mcp
```
→ You should see **figma** listed.

```
/plugin list
```
→ You should see **chrome-devtools-mcp** and **figma-friend** listed.

If anything is missing, go back to the relevant step above.

---

## Troubleshooting

**"command not found: claude"**
Close Terminal, reopen it, and try again. If it still fails, reinstall Node.js from [nodejs.org](https://nodejs.org) and re-run `npm install -g @anthropic-ai/claude-code`.

**Red "permission denied" error during npm install**
Run `sudo npm install -g @anthropic-ai/claude-code` instead. Enter your Mac password when prompted.

**Figma not showing in /mcp**
Re-run `claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user` in Terminal (outside Claude Code), then restart Claude Code and try `/mcp` again.

**Figma authentication fails**
Make sure you're logged into Figma in your browser before authenticating. Try again via `/mcp` → figma → Authenticate.

**Push to Figma fails or Claude can't control the browser**
Run `/plugin list` and confirm both `chrome-devtools-mcp` and `figma-friend` are listed. Also make sure Chrome is installed.

**The skill doesn't appear when I type `/doc`**
Re-run the `curl` command from Step 5. If it still doesn't show up, restart Claude Code.

**"I don't know which folder the files were saved in"**
Open Finder, click your name in the sidebar (under "Favourites"). The `.md` and `.html` files will be there. If you don't see them, press **Cmd+Shift+.** to show hidden files.

---

## Updating the skill

To get the latest version, run this in Terminal (outside Claude Code):

```bash
curl -fsSL -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```
