# 股票損益管理系統 Stock P&L Management

純前端的股票買賣紀錄與損益分析工具，所有資料都存在瀏覽器的 LocalStorage，不需要後端。

## Live Demo

部署到 GitHub Pages 後，網址會是：

```
https://<你的-github-帳號>.github.io/stock/
```

## 快速開始

直接打開 `index.html` 即可使用，或部署到任何靜態網站服務（GitHub Pages、Netlify、Vercel⋯）。

完整安裝步驟請看 [SETUP.md](./SETUP.md)。

## 功能

- 股票買賣紀錄
- 損益計算與統計
- 多帳戶比較
- 中文介面（繁體）

## 更新流程

修改 `index.html` 後，執行：

```bash
./push.sh "你的更新說明"
```

就會自動 commit + push 到 GitHub，Pages 會在幾十秒內更新。

## 開發

主要檔案就只有一個 `index.html`，內含 HTML / CSS / JS。直接編輯即可。

如果你用 [Claude Code](https://claude.com/claude-code) 協助開發，可以參考 [CLAUDE.md](./CLAUDE.md) 的專案指引。
