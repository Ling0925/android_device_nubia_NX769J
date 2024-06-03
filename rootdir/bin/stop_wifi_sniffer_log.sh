#!/vendor/bin/sh

module_name=$(getprop vendor.wifisniffer.modulename)
iface="wlan0"

#step 1
/vendor/bin/ifconfig "${iface}" down

#step 2
echo 0 > '/sys/module/'${module_name}'/parameters/con_mode'

#step 3
#/system/bin/svc wifi enable
