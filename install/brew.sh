# Install and configure Homebrew.

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipping Homebrew install (missing: ruby, curl and/or git)"
  return
fi

# Install Homebrew.

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update Homebrew.
brew update
brew upgrade

# Install bash-git-prompt
brew install bash-git-prompt

# Add tap for additional versions of certain apps.
brew tap caskroom/versions