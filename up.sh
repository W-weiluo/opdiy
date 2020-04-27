mkdir -p diy
#Lean
svn co --force -q https://github.com/coolsnowwolf/lede/trunk/package/lean ../lean && svn revert -R ../lean && rm -rf ../lean/.svn && rm -rf ../lean/samba4 && rm -rf ../lean/luci-app-samba4 && rm -rf ../lean/luci-app-ttyd && rm -rf ../lean/luci-theme-argon && rm -rf ../lean/luci-app-dnsforwarder && rm -rf ../lean/dnsforwarder && rm -rf lean && mv ../lean ./ && echo "Lean更新成功" || echo "Lean暂无更新"
#helloworld
git clone --depth 1 https://github.com/fw876/helloworld.git ../helloworld && [ -e ../helloworld/luci-app-ssr-plus/Makefile ] && rm -rf ../helloworld/.git && rm -rf diy/helloworld && mv ../helloworld diy && echo "helloworld更新成功" || echo "helloworld暂无更新"
#OpenClash
git clone --depth 1 https://github.com/vernesong/OpenClash.git ../OpenClash && [ -e ../OpenClash/luci-app-openclash/Makefile ] && rm -rf ../OpenClash/.git && rm -rf diy/OpenClash && mv ../OpenClash diy && echo "OpenClash更新成功" || echo "OpenClash暂无更新"
#chinadns-ng
git clone --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git ../chinadns-ng && [ -e ../chinadns-ng/Makefile ] && rm -rf ../chinadns-ng/.git && rm -rf diy/chinadns-ng && cp -a ../chinadns-ng diy && echo "chinadns-ng更新成功" || echo "chinadns-ng暂无更新"
#luci-app-v2ray
git clone --depth 1 https://github.com/kuoruan/luci-app-v2ray.git ../luci-app-v2ray && [ -e ../luci-app-v2ray/Makefile ] && rm -rf ../luci-app-v2ray/.git && rm -rf diy/luci-app-v2ray && cp -a ../luci-app-v2ray diy && echo "luci-app-v2ray更新成功" || echo "luci-app-v2ray暂无更新"
#luci-app-adguardhome
git clone --depth 1 https://github.com/rufengsuixing/luci-app-adguardhome.git ../luci-app-adguardhome && [ -e ../luci-app-adguardhome/Makefile ] && rm -rf ../luci-app-adguardhome/.git && rm -rf diy/luci-app-adguardhome && cp -a ../luci-app-adguardhome diy && echo "luci-app-adguardhome更新成功" || echo "luci-app-adguardhome暂无更新"
#CTCGFW
svn co --force -q https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw ../ctcgfw && svn revert -R ../ctcgfw && rm -rf ../ctcgfw/.svn && mkdir -p diy/ctcgfw && \
[ -e ../ctcgfw/gost/Makefile ] && rm -rf diy/ctcgfw/gost && mv ../ctcgfw/gost diy/ctcgfw && echo "gost更新成功" || echo "gost暂无更新"
[ -e ../ctcgfw/luci-app-gost/Makefile ] && rm -rf diy/ctcgfw/luci-app-gost && mv ../ctcgfw/luci-app-gost diy/ctcgfw && echo "luci-app-gost更新成功" || echo "luci-app-gost暂无更新"
[ -e ../ctcgfw/gowebdav/Makefile ] && rm -rf diy/ctcgfw/gowebdav && mv ../ctcgfw/gowebdav diy/ctcgfw && echo "gowebdav更新成功" || echo "gowebdav暂无更新"
[ -e ../ctcgfw/luci-app-gowebdav/Makefile ] && rm -rf diy/ctcgfw/luci-app-gowebdav && mv ../ctcgfw/luci-app-gowebdav diy/ctcgfw && echo "luci-app-gowebdav更新成功" || echo "luci-app-gowebdav暂无更新"
#Rclone-OpenWrt
git clone --depth 1 https://github.com/ElonH/Rclone-OpenWrt.git ../Rclone-OpenWrt && [ -e ../Rclone-OpenWrt/luci-app-rclone/Makefile ] && rm -rf ../Rclone-OpenWrt/.git && rm -rf diy/Rclone-OpenWrt && mv ../Rclone-OpenWrt diy && echo "Rclone-OpenWrt更新成功" || echo "Rclone-OpenWrt暂无更新"
#更新AdGuardHome.yaml
wget -q https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf && \
sed -e 's|^server=/\(.*\)/114.114.114.114$$|\1|' accelerated-domains.china.conf | egrep -v '^#' > accelerated-domains.china.raw.txt && \
sed -i "s/server=/  - '[/g;s/114.114.114.114/]https:\/\/dns.alidns.com\/dns-query'/g" accelerated-domains.china.raw.txt && \
sed -i '/dns.alidns.com\/dns-query/d' config/AdGuardHome/AdGuardHome.yaml && \
sed -i '40r accelerated-domains.china.raw.txt' config/AdGuardHome/AdGuardHome.yaml && \
rm -rf accelerated* && echo "AdGuardHome.yaml更新成功" || echo "AdGuardHome.yaml暂无更新"
echo "======================="
git add . && git commit -m "$(date "+%Y%m%d-%H%M")" && git push && echo "更新完毕!!!" || echo "暂无更新!!!"
echo "======================="
