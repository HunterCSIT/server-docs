
#!/bin/bash


echo "********** updating PYHELP **********"
curl https://raw.githubusercontent.com/HunterCSIT/server-docs/main/scripts/pyhelp.sh > /usr/local/bin/pyhelp
chown root:root /usr/local/bin/pyhelp
chmod 755 /usr/local/bin/pyhelp

