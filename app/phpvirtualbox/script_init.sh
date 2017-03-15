#!/bin/bash
set -euxo pipefail

PVB_VERSION=5.0-5
cd /opt
wget --no-verbose https://sourceforge.net/projects/phpvirtualbox/files/phpvirtualbox-$PVB_VERSION.zip/download
unzip -q phpvirtualbox-$PVB_VERSION.zip
rm phpvirtualbox-$PVB_VERSION.zip
mv phpvirtualbox-$PVB_VERSION phpvirtualbox

# https://github.com/clue/docker-phpvirtualbox/blob/master/config.php
cat > /opt/phpvirtualbox/config.php <<'EOL'
<?php
class phpVBoxConfig {
var $username = 'vbox';
var $password = 'pass';
var $location = 'http://172.17.0.1:18083/';
var $language = 'en';
var $vrdeports = '9000-9100';
var $maxProgressList = 5;
var $deleteOnRemove = true;
var $browserRestrictFiles = array('.iso','.vdi','.vmdk','.img','.bin','.vhd','.hdd','.ovf','.ova','.xml','.vbox','.cdr','.dmg','.ima','.dsk','.vfd');
var $hostMemInfoRefreshInterval = 5;
var $consoleResolutions = array('640x480','800x600','1024x768','1280x720','1440x900');
var $consoleKeyboardLayout = 'EN';
var $nicMax = 4;
}
EOL

rm /script_init.sh
exit 0