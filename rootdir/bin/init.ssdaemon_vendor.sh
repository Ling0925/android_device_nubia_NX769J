#! /vendor/bin/sh

#
# Copyright (c) 2019 ZTE Corporation.
# All Rights Reserved.
# Confidential and Proprietary - ZTE Corporation.
#

# don't add spaces before or after the assignment operator '='
soc_vendor=`getprop ro.vendor.feature.soc_vendor`

# soc_vendor prop still not change to ro.vendor.* on P
if [ -z "$soc_vendor" ]; then
    soc_vendor=`getprop ro.feature.soc_vendor`
fi

# start different service per soc vendor
if [ "$soc_vendor" = "mediatek" ]; then
    start mtk-ssdaemon_vendor
elif [ "$soc_vendor" = "sprd" ]; then
    start sprd-ssdaemon_vendor
elif [ "$soc_vendor" = "qcom" ]; then
    start qti-ssdaemon_vendor
    start qti-msdaemon_vendor-0

    multisim=`getprop persist.radio.multisim.config`

    if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
        start qti-msdaemon_vendor-1
    fi
fi
