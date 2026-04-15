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
echo "  1. Open Claude Code:  claude"
echo "  2. Use the skill:     /document-component YOUR_FIGMA_LINK"
echo ""
echo "First time? See the full setup guide:"
echo "  https://github.com/mehuljatiya/figma-component-documentation/blob/main/SETUP.md"
echo ""
