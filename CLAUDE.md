# CLAUDE.md

這份文件提供給 [Claude Code](https://claude.com/claude-code) 使用，說明本專案的結構與開發慣例。

## 專案概要

純前端的「股票損益管理系統」（繁體中文介面）。整個應用就是一個 `index.html`，內含 HTML / CSS / 原生 JavaScript，**沒有 build step、沒有後端、沒有套件管理**。

資料存在瀏覽器的 `localStorage`，沒有資料庫。

## 檔案結構

```
.
├── index.html      # 整個應用（HTML + CSS + JS 全在這）
├── push.sh         # 一鍵 commit + push 到 GitHub
├── README.md       # 專案說明
├── SETUP.md        # 從零開始的安裝步驟
└── CLAUDE.md       # 本檔案
```

## 開發慣例

- **不要引入 build tool**（webpack、vite、npm⋯）。本專案刻意保持單檔零依賴。
- **不要拆檔**。CSS 與 JS 都直接寫在 `index.html` 的 `<style>` / `<script>` 區塊裡。
- **不要加後端**。所有資料用 `localStorage`。
- **介面文字使用繁體中文**。
- **保留 CSS 變數命名習慣**（`--bg`、`--accent`、`--green` 等定義在 `:root`）。

## 測試

沒有自動化測試。修改後請：

1. 直接在瀏覽器打開 `index.html`
2. 手動驗證新增 / 刪除 / 編輯紀錄、切換帳戶、比較模式都正常
3. 確認 `localStorage` 的資料沒被破壞

## 部署

`main` 分支推上 GitHub 後，GitHub Pages 會自動部署。流程：

```bash
./push.sh "你的更新說明"
```

詳見 [SETUP.md](./SETUP.md)。

## 變更小提醒

- 改動 `index.html` 時務必保留現有 `localStorage` 的 schema（key 名稱、欄位），避免使用者既有資料消失。
- 如果一定要改 schema，請在程式內加上 migration 邏輯。
