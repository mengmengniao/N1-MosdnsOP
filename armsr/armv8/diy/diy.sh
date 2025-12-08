#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 clone/passwall


#  MosDNS 
rm -rf feeds/luci/applications/luci-app-mosdns
git clone https://github.com/sbwml/luci-app-mosdns.git /tmp/sbwml_mosdns
cp -r /tmp/sbwml_mosdns/luci-app-mosdns package/luci-app-mosdns
git clone --depth 1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
rm -rf /tmp/sbwml_mosdns


# Update packages
rm -rf feeds/luci/applications/luci-app-passwall
cp -rf clone/amlogic/luci-app-amlogic clone/passwall/luci-app-passwall feeds/luci/applications/

# Clean packages
rm -rf clone
