# Setup Guide

> Mac only · Takes ~15 minutes

---

## 1 — Create an Anthropic account

Sign up at [claude.ai](https://claude.ai) and subscribe to the **Pro plan ($20/month)**.

---

## 2 — Install Claude Code

**Easiest:** Download the desktop app → [claude.ai/download](https://claude.ai/download)

**Or via Terminal:**
```
npm install -g @anthropic-ai/claude-code
```
> Permission error? Run `sudo npm install -g @anthropic-ai/claude-code` instead and enter your Mac password.

Then start it:
```
claude
```

---

## 3 — Connect Figma

In Terminal (press **Ctrl+C** first if Claude Code is running):
```
claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user
```

Then restart Claude Code, type `/mcp`, select **figma** with arrow keys, choose **Authenticate**, and log in with your Figma account.

---

## 4 — Install Chrome DevTools plugin

Inside Claude Code:
```
/plugin install chrome-devtools-mcp@chrome-devtools-plugins
```

> Requires Google Chrome to be installed.

---

## 5 — Install figma-friend plugin

Inside Claude Code, run these one at a time:
```
/plugin marketplace add https://github.com/markacianfrani/claude-code-figma.git
```
```
/plugin install figma-friend@figma-friend-marketplace
```

---

## 6 — Install the skill

In Terminal (press **Ctrl+C** to exit Claude Code first):
```
curl -fsSL -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```

---

## 7 — Use it

In Figma, right-click any component → **Copy link to selection**.

In Claude Code:
```
/document-component YOUR_FIGMA_LINK
```

Claude writes the docs, opens a preview in your browser, and asks if you want to push it into Figma.

> Files are saved in your home folder (visible in Finder under your name in the sidebar).

---

## Something not working?

| Problem | Fix |
|---|---|
| `command not found: claude` | Close and reopen Terminal, try again |
| Permission error on npm install | Use `sudo npm install -g @anthropic-ai/claude-code` |
| Figma not connecting | Re-run the `claude mcp add` command, restart Claude Code, authenticate again |
| Plugin not showing in `/plugin list` | Re-run the install command for that plugin |
| Skill not showing when you type `/doc` | Re-run the `curl` command, restart Claude Code |
| Don't know where files were saved | Open Finder → click your name in the sidebar |

---

**Update the skill anytime:**
```
curl -fsSL -o ~/.claude/commands/document-component.md https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md
```
