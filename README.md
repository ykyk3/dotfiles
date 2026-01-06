# dotfiles

個人用のdotfiles管理リポジトリ。chezmoiを使用して複数環境での設定を管理。

## 対応環境

- macOS
- Windows (WSL推奨)  
- Linux/WSL

## クイックスタート

### macOS / Linux / WSL
```bash
# ワンライナーでセットアップ
curl -fsSL https://raw.githubusercontent.com/ykyk3/dotfiles/master/install.sh | bash
```

### Windows (PowerShell)
```powershell
# PowerShellを管理者権限で実行
irm https://raw.githubusercontent.com/ykyk3/dotfiles/master/install.ps1 | iex

# または手動でダウンロードして実行
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ykyk3/dotfiles/master/install.ps1" -OutFile "install.ps1"
.\install.ps1
```

## カスタマイズ

個人設定は以下のファイルで管理:
- `~/.gitconfig.local` - Git個人設定
- `~/.aliases.local` - ローカル専用エイリアス