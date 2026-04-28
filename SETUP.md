# SETUP.md — 從零開始把 stock 上架到 GitHub Pages

完全沒做過 git / GitHub Pages 也沒關係，照著做就好。整個流程大概 10 分鐘。

## 0. 你需要

- 一個 [GitHub](https://github.com) 帳號
- 電腦上裝好 [git](https://git-scm.com/downloads)
- （建議）裝好 [Claude Code](https://claude.com/claude-code) — 後面更新會方便很多

---

## 1. 建一個本機資料夾

開終端機（Terminal / PowerShell / iTerm⋯）：

```bash
mkdir stock
cd stock
```

把 `index.html` 放進這個資料夾裡。

---

## 2. 在 GitHub 建一個 repo

1. 登入 GitHub → 右上角 `+` → **New repository**
2. **Repository name** 填 `stock`
3. **Public**（GitHub Pages 免費版需要 public）
4. **不要**勾「Add a README」、「.gitignore」、「license」（我們本地會自己加）
5. 按 **Create repository**

建完後 GitHub 會給你一個指令列表，先別急著貼，往下看。

---

## 3. 第一次 push 到 GitHub

回到終端機，在 `stock/` 資料夾裡執行（把 `<你的帳號>` 換成自己的 GitHub 帳號）：

```bash
git init
git add .
git commit -m "initial commit"
git branch -M main
git remote add origin https://github.com/<你的帳號>/stock.git
git push -u origin main
```

第一次 push 會要你登入 GitHub。建議用 [Personal Access Token](https://github.com/settings/tokens) 當密碼。

---

## 4. 開啟 GitHub Pages

1. 到你 repo 頁面 → **Settings** → 左側 **Pages**
2. **Source** 選 `Deploy from a branch`
3. **Branch** 選 `main`，資料夾選 `/ (root)`
4. **Save**

等 30 秒～1 分鐘，重新整理 Pages 頁面，會看到：

```
Your site is live at https://<你的帳號>.github.io/stock/
```

打開那個網址就能用了。

---

## 5. 裝 Claude Code（選用，但很推薦）

```bash
# macOS / Linux
curl -fsSL https://claude.com/install.sh | bash

# 或用 npm
npm install -g @anthropic-ai/claude-code
```

裝好之後，在 `stock/` 資料夾裡跑：

```bash
claude
```

第一次會要你登入。之後就可以直接跟它對話叫它改 `index.html`。

專案的開發指引寫在 [CLAUDE.md](./CLAUDE.md)，Claude Code 會自動讀。

---

## 6. 之後更新都用 `./push.sh`

改完 `index.html` 後，一行指令搞定：

```bash
./push.sh "加了損益圖表"
```

它會自動：

1. `git add .`
2. `git commit -m "你的訊息"`
3. `git push`

GitHub Pages 會在 30 秒內更新。

> 第一次跑可能要先給執行權限：
> ```bash
> chmod +x push.sh
> ```

---

## 常見卡關

**Q: push 時要密碼，但密碼一直錯**
A: GitHub 已經不接受帳密了，要用 [Personal Access Token](https://github.com/settings/tokens)（建立時勾 `repo` 權限）當密碼。

**Q: Pages 開了但網址打開是 404**
A: 等 1~2 分鐘，第一次部署比較慢。還是不行就確認 Settings → Pages 的 Branch 是 `main`、資料夾是 `/ (root)`。

**Q: `./push.sh: Permission denied`**
A: 執行 `chmod +x push.sh`。

**Q: 我想換成自己的網域**
A: Settings → Pages → Custom domain 填你的網域，再到 DNS 設 CNAME 指向 `<你的帳號>.github.io`。

---

有任何步驟卡住，截圖貼給我就好。
