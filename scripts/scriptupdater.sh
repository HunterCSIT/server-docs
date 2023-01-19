
#!/bin/bash

echo "********** updating PYHELP **********"
curl -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache"  -H "Expires: 0" https://raw.githubusercontent.com/HunterCSIT/server-docs/main/scripts/pyhelp.sh > /usr/local/bin/pyhelp
chown root:root /usr/local/bin/pyhelp
chmod 755 /usr/local/bin/pyhelp
