if ! is-macos -o ! is-executable brew; then
  echo "Skipped: gem"
  return
fi

\curl -sSL https://get.rvm.io | bash -s stable

rvm install 2.3
rvm use 2.3 --default

gem install lolcat