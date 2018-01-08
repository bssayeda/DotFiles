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
    python34
    py34-pip
    npm5
    cowsay
    fortune
    unar
)

sudo /opt/local/bin/port install "${apps[@]}"
sudo /opt/local/bin/port select --set python python34
sudo /opt/local/bin/port select --set pip pip34