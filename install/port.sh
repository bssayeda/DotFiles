# Installing MacPorts and other command line tools.

current_working_directory=$(pwd)

# Download MacPorts.
cd $TMPDIR
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.4.1.tar.bz2
tar xf MacPorts-2.4.1.tar.bz2

cd MacPorts-2.4.1/
./configure
make
sudo make install

# Install command-line tools with MacPorts.

# Update MacPorts

sudo /opt/local/bin/port selfupdate
sudo /opt/local/bin/port upgrade outdated

# Install bash and bash-completion

sudo /opt/local/bin/port install bash
sudo /opt/local/bin/port install bash-completion

# Install +bash_completion variant automatically with all ports
grep "+bash_completion" /opt/local/etc/macports/variants.conf &>/dev/null || bash -c "echo +bash_completion >> /opt/local/etc/macports/variants.conf"

# Install packages

apps=(
    git
    rbenv
    ruby-build
    coreutils
    python
    npm
)

sudo /opt/local/bin/port install "${apps[@]}"

cd $current_working_directory