#!/bin/bash

# figma-component-documentation — install script
# Copies the document-component skill to ~/.claude/commands/

set -e

SKILL_URL="https://raw.githubusercontent.com/mehuljatiya/figma-component-documentation/main/document-component.md"
DEST="$HOME/.claude/commands/document-component.md"

echo ""
echo "Installing /document-component skill for Claude Code..."

# Create the commands directory if it doesn't exist
mkdir -p "$HOME/.claude/commands"

# Download the skill
curl -fsSL "$SKILL_URL" -o "$DEST"

echo ""
echo "✓ Skill installed at $DEST"
echo ""
echo "Next steps:"
echo ""
echo "  Inside Claude Code, verify these are set up:"
echo ""
echo "  Figma MCP (run in terminal, outside Claude):"
echo "    claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user"
echo ""
echo "  Chrome DevTools plugin (run inside Claude Code):"
echo "    /plugin install chrome-devtools-mcp@chrome-devtools-plugins"
echo ""
echo "  figma-friend plugin (run inside Claude Code, two commands):"
echo "    /plugin marketplace add https://github.com/markacianfrani/claude-code-figma.git"
echo "    /plugin install figma-friend@figma-friend-marketplace"
echo ""
echo "  Then use the skill:"
echo "    /document-component YOUR_FIGMA_LINK"
echo ""
echo "Full setup guide (start here if you're new):"
echo "  https://github.com/mehuljatiya/figma-component-documentation/blob/main/SETUP.md"
echo ""
