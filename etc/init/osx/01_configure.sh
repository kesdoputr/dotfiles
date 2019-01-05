#!/bin/bash

set -eu

if ! command -v defaults > /dev/null 2>&1; then
    echo "\`defaults\` not found. Nothing to do."
    exit 0
fi

echo "Configuring..."

# http://fnwiya.hatenablog.com/entry/2015/11/06/155255

#
# Global
#

# 起動音を小さく
# sudo nvram SystemAudioVolume=%05

# フルキーボードアクセスを有効
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Fuキーを標準のファンクションキーとして使用
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# キーのリピート
defaults write NSGlobalDomain KeyRepeat -int 3

# リピート入力認識までの時間
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# サイドバーのアイコンサイズを大きく
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true

# 印刷ダイアログを詳細設定で表示 (10.6 and before, Key name is PMPrintingExpandedStateForPrint)
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -boolean true

# ファイルの保存場所のデフォルトをiCloud以外にする
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# 外部ディスプレイでアンチエイリアスを有効にする（サブピクセルレンダリングを「中」レベルで設定）
# defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

#
# Menubar
#

# バッテリー残量を％表記に
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
# defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

#
# Dock
#

# 通常サイズ
defaults write com.apple.dock tilesize -int 32

# 拡大を有効にする
defaults write com.apple.dock magnification -bool yes

# 拡大時のサイズ (一般的な最大: 128)
defaults write com.apple.dock largesize -int 80

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array

# Dockをすぐに表示する
# defaults write com.apple.dock autohide-delay -float 0

# Dockの位置を右端、または下端によせる
# defaults write com.apple.dock pinning -string end

#
# ホットコーナー
#
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner
defaults write com.apple.dock wvous-tl-corner -int 12
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner
defaults write com.apple.dock wvous-br-corner -int 2
defaults write com.apple.dock wvous-br-modifier -int 0

# 設定反映
killall Dock


#
# Finder
#

# デフォルトはカラムビュー表示
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# 隠しファイルや隠しフォルダを表示
# defaults write com.apple.finder AppleShowAllFiles -bool true

# デスクトップ上にアイコンを表示しない
# defaults write com.apple.finder CreateDesktop -boolean false

# タイトルバーにフルパスを表示
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# 他のウィンドウに移った時にQuick Lookを非表示する
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true

# Quick Look上でテキストの選択を可能に
# NOTE 今は動いていないっぽい
defaults write com.apple.finder QLEnableTextSelection -bool true

# フォルダを開くときのアニメーションを無効
# defaults write com.apple.finder AnimateWindowZoom -bool false

# ファイルを開くときのアニメーションを無効
# defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Finderのアニメーション効果を全て無効にする
# defaults write com.apple.finder DisableAllAnimations -bool true

# スクロールバーの弾むアニメーションを無効にする
# defaults write -g NSScrollViewRubberbanding -bool no

# ダイアログ表示やウィンドウリサイズ速度を高速化
# defaults write -g NSWindowResizeTime 0.1

# Finderの効果音を無効にする
# defaults write com.apple.finder FinderSounds -bool no

# ファイルを開く際の警告ダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# 「ライブラリ」を常に表示
chflags nohidden ~/Library

# クラッシュリポーターを無効にする
# defaults write com.apple.CrashReporter DialogType none


# # マウントされたディスクがあったら、自動的に新しいウィンドウを開く
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Finder再起動して設定を反映
killall Finder

#
# System
#

# ネットワークフォルダに.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#
# Screen Capture
#

# キャプチャの保存場所を変更
defaults write com.apple.screencapture location ~/Pictures

# キャプチャのプレフィックスを変更
defaults write com.apple.screencapture name "SS_"

# キャプチャに影を付けない
defaults write com.apple.screencapture disable-shadow -boolean true

# 設定を反映
killall SystemUIServer

echo ""
echo "Configuration Complete!"
echo "Please restart Mac to make sure settings are reflected."
