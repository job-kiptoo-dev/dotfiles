#!/usr/bin/env bash
set -euo pipefail

# === Load .env ===
if [ -f "$HOME/dotfiles/.env" ]; then
  set -a
  source "$HOME/dotfiles/.env"
  set +a
else
  echo "❌ GitHub token not found at $HOME/dotfiles/.env"
  exit 1
fi

# Trap errors
trap 'echo "❌ Something went wrong. Exiting..."; exit 1' ERR

# === Config ===
GITHUB_USER="job-kiptoo-dev"   # change if needed
REPO_NAME=$(basename "$PWD")

# if [ $# -gt 0 ]; then
if [ $# -gt 0 ] && [[ "$1" != "./" ]]; then
  DESCRIPTION="$*"
else
  read -rp "📝 Enter a description for '$REPO_NAME': " DESCRIPTION
  DESCRIPTION=${DESCRIPTION:-"Auto-created repo"}
fi

TOKEN=${GITHUB_TOKEN:-}

if [ -z "$TOKEN" ]; then
  echo "❌ GITHUB_TOKEN not set in .env"
  exit 1
fi

echo "📦 Creating repo '$REPO_NAME' for user '$GITHUB_USER'..."

# === Step 1: Create repo via API ===
response=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO_NAME\", \"description\":\"$DESCRIPTION\", \"private\":false}")

if [ "$response" -eq 201 ]; then
  echo "✅ GitHub repo created successfully."
elif [ "$response" -eq 422 ]; then
  echo "⚠️ Repo already exists on GitHub. Continuing..."
else
  echo "❌ Failed to create repo on GitHub (HTTP $response)."
  exit 1
fi

# === Step 2: Git init ===
if [ ! -d .git ]; then
  echo "🔧 Initializing git repo locally..."
  git init
fi

# === Step 3: Commit ===
git add .
git commit -m "Initial commit" || echo "⚠️ Nothing to commit, skipping..."

# === Step 4: Remote origin (SSH) ===
git branch -M main
git remote add origin git@github.com:$GITHUB_USER/$REPO_NAME.git 2>/dev/null || \
git remote set-url origin git@github.com:$GITHUB_USER/$REPO_NAME.git

# === Step 5: SSH key scan ===
ssh-keyscan -H github.com >> ~/.ssh/known_hosts 2>/dev/null

# === Step 6: Push ===
echo "🚀 Pushing to GitHub..."
git push -u origin main || { echo "❌ Push failed. Check your SSH key setup."; exit 1; }

echo "✅ Done! Repo available at: https://github.com/$GITHUB_USER/$REPO_NAME"

