#!/usr/bin/env bash
# push.sh — 一鍵 commit + push 到 GitHub
# 用法： ./push.sh "你的更新訊息"
#       ./push.sh                  # 沒帶訊息會用預設

set -e

MSG="${1:-update}"

if [ -z "$(git status --porcelain)" ]; then
  echo "沒有任何改動，不用 push。"
  exit 0
fi

BRANCH="$(git rev-parse --abbrev-ref HEAD)"

git add .
git commit -m "$MSG"
git push -u origin "$BRANCH"

echo ""
echo "✅ 已推送到 origin/$BRANCH"
echo "   GitHub Pages 通常在 30 秒內會更新。"
