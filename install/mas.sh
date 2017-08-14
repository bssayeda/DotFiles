# Installing mas-cli and installing App Store applications.

current_working_directory=$(pwd)

# Download MacPorts.
cd $TMPDIR
git clone https://github.com/mas-cli/mas.git
cd mas

./script/build

sudo cp ./build/mas /opt/local/bin

cd $current_working_directory

apps=(
    688211836 # EasyRes
    402383384 # Base
    443987910 # 1Password
    587512244 # Kaleidoscope
    918858936 # Airmail 3
    557168941 # Tweetbot
    909566003 # iHex
    1225570693 # Ulysses
    409183694 # Keynote
    409201541 # Pages
    409203825 # Numbers
    449830122 # HyperDock
)

 /opt/local/bin/mas install "${apps[@]}"