#!/bin/sh

TARGET_PATH="/usr/lib/lua/luci/view/passwall2/node_list/node_list.htm"
UNINSTALLER_PATH="/usr/bin/passwall2-urltest-uninstall"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0;m'

# =================================================
#  UNINSTALL BLOCK
# =================================================
if [ "$1" = "uninstall" ]; then
    echo "Initiating Uninstallation Process..."
    if [ -f "$TARGET_PATH" ]; then
        # Remove injected payload block cleanly without overwriting the whole file
        sed -i '/<!-- INJECTED PASSWALL2 URL-TEST PATCH/,/<!-- END OF INJECTED PATCH -->/d' "$TARGET_PATH"
        rm -f "${TARGET_PATH}.bak"
        rm -f /tmp/luci-indexcache /tmp/luci-modulecache
        rm -f "$UNINSTALLER_PATH"
        
        echo -e "${GREEN}=================================================${NC}"
        echo -e "${GREEN} Patch successfully removed!${NC}"
        echo -e " Cleaned injected payload directly from native file."
        echo " Please refresh your browser using Ctrl + F5."
        echo -e "${GREEN}=================================================${NC}"
        exit 0
    else
        echo -e "${RED}Error: Target file not found.${NC}"
        exit 1
    fi
fi

# =================================================
#  INSTALL BLOCK
# =================================================
echo "Checking system compatibility..."

if [ ! -f "$TARGET_PATH" ]; then
    echo -e "${RED}Error: Target file not found at: $TARGET_PATH${NC}"
    exit 1
fi

cd /usr/lib/lua/luci/view/passwall2/node_list/

# Clean existing injected code first to prevent duplicates
sed -i '/<!-- INJECTED PASSWALL2 URL-TEST PATCH/,/<!-- END OF INJECTED PATCH -->/d' "$TARGET_PATH"

echo "Downloading and injecting Universal Smart Payload..."
wget --no-check-certificate -T 20 -qO /tmp/payload.htm https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/payload.htm

if [ $? -eq 0 ] && [ -s "/tmp/payload.htm" ]; then
    cat /tmp/payload.htm >> "$TARGET_PATH"
    rm -f /tmp/payload.htm
else
    echo -e "${RED}Download failed! No changes were made.${NC}"
    exit 1
fi

rm -rf /tmp/luci-indexcache /tmp/luci-modulecache

# Generate Offline Uninstaller
cat << 'EOF' > /usr/bin/passwall2-urltest-uninstall
#!/bin/sh
TARGET_PATH="/usr/lib/lua/luci/view/passwall2/node_list/node_list.htm"
UNINSTALLER_PATH="/usr/bin/passwall2-urltest-uninstall"

if [ -f "$TARGET_PATH" ]; then
    sed -i '/<!-- INJECTED PASSWALL2 URL-TEST PATCH/,/<!-- END OF INJECTED PATCH -->/d' "$TARGET_PATH"
    rm -f "${TARGET_PATH}.bak"
    rm -f /tmp/luci-indexcache /tmp/luci-modulecache
    rm -f "$UNINSTALLER_PATH"
    echo -e "\033[0;32mPassWall 2 URL-Test Patch removed successfully!\033[0;m"
else
    echo -e "\033[0;31mError: Target file not found!\033[0;m"
fi
EOF

chmod +x /usr/bin/passwall2-urltest-uninstall

echo "================================================="
echo -e "${GREEN} PassWall 2 Universal Patch Applied Successfully!${NC}"
echo -e " Local uninstaller ready: ${YELLOW}passwall2-urltest-uninstall${NC}"
echo " Please refresh your browser using Ctrl + F5."
echo "================================================="
