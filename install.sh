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
echo "  Make sure these MCPs are configured in Claude Code (/mcp to check):"
echo "    - figma          →  claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user"
echo "    - chrome-devtools →  claude mcp add chrome-devtools npx @agentdeskai/browser-tools-mcp@latest"
echo "    - figma-friend   →  claude mcp add figma-friend npx github:markacianfrani/claude-code-figma"
echo ""
echo "  Then use the skill:"
echo "    claude → /document-component YOUR_FIGMA_LINK"
echo ""
echo "Full setup guide (start here if you're new):"
echo "  https://github.com/mehuljatiya/figma-component-documentation/blob/main/SETUP.md"
echo ""
