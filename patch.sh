#!/bin/sh

# 1. Navigate to directory and backup the original file if not exists
cd /usr/lib/lua/luci/view/passwall2/node_list/
[ -f node_list.htm.bak ] || cp node_list.htm node_list.htm.bak

# 2. Download the pre-patched file from GitHub repository directly
wget --no-check-certificate -qO node_list.htm https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/node_list.htm

# 3. Clean up LuCI cache to apply changes immediately
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache

echo "================================================="
echo " PassWall 2 Test All URLs Patch Applied Successfully!"
echo " Please refresh your browser using Ctrl + F5."
echo "================================================="
