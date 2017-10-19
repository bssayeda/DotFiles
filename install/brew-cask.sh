# Install apps with Homebrew-Cask.

if ! is-macos -o ! is-executable brew; then
  echo "Skipping Homebrew-Cask app installs..."
  return
fi

# Install packages

apps=(
    alfred
    dash
    google-chrome
    hopper-disassembler
    iterm2-beta
    macports
    paw
    sublime-text
    teamviewer
    tower
    transmit
    visual-studio-code
    wwdc
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package