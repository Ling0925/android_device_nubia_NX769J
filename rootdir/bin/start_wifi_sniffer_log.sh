#!/vendor/bin/sh

module_name=$(getprop vendor.wifisniffer.modulename)
iface="wlan0"
channel=$(getprop vendor.wifisniffer.channel)
bandwidth=$(getprop vendor.wifisniffer.bandwidth)

#####debug info#####
echo "wlan module name:""${module_name}"
echo "iface:""${iface}"
echo "sniffer channel:""${channel}"
echo "sniffer bandwidth:""${bandwidth}"
#####debug info#####

#step 1
#/system/bin/svc wifi disable

#step 2
echo 4 > '/sys/module/'${module_name}'/parameters/con_mode'

#step 3
/vendor/bin/ifconfig "${iface}" up

#step 4
#/vendor/bin/iwpriv "${iface}" setMonChan "${channel}" "${bandwidth}"
# for Android U
echo "${channel}" "${bandwidth}" > '/sys/class/net/'${iface}'/monitor_mode_channel'
