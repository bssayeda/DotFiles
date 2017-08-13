# Configure this version of bash to be used.

grep "/opt/local/bin/bash" /private/etc/shells &>/dev/null || sudo bash -c "echo /opt/local/bin/bash >> /private/etc/shells"
chsh -s /opt/local/bin/bash
