#!/bin/sh

# Precise absolute path to the target file
TARGET_PATH="/usr/lib/lua/luci/view/passwall2/node_list/node_list.htm"

# Color constants for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0;m' # No Color

echo "Checking system compatibility..."

# 1. Strict compatibility wall with dedicated Error Block Layout
if [ ! -f "$TARGET_PATH" ]; then
    echo -e "${RED}"
    echo "#################################################"
    echo "               INSTALLATION ERROR                "
    echo "#################################################"
    echo -e "${NC}"
    echo -e "${YELLOW}Reason:${NC} Target file not found at:"
    echo -e "        $TARGET_PATH"
    echo ""
    echo -e "${RED}Compatibility Mismatch:${NC}"
    echo "This patch is NOT compatible with your current PassWall 2"
    echo "version or firmware directory structure."
    echo ""
    echo -e "${GREEN}Safe Abort:${NC} No changes or backups were made to your system."
    echo -e "${RED}#################################################${NC}"
    echo ""
    exit 1
fi

echo -e "${GREEN}Compatibility check passed! Proceeding with installation...${NC}"

# 2. Safely navigate to the directory now that we know the file exists
cd /usr/lib/lua/luci/view/passwall2/node_list/

# 3. Smart Backup Logic - Protect the original untampered file
if [ ! -f "node_list.htm.bak" ]; then
    cp node_list.htm node_list.htm.bak
    echo "Original system backup created successfully: node_list.htm.bak"
else
    echo -e "${YELLOW}Notice:${NC} An existing original backup was found. Skipping backup modification to protect your original files."
fi

# 4. Download the pre-patched file from GitHub repository directly
wget --no-check-certificate -qO node_list.htm https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/node_list.htm

# 5. Clean up LuCI Cache to apply changes immediately
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache

echo "================================================="
echo -e "${GREEN} PassWall 2 Test All URLs Patch Applied Successfully!${NC}"
echo " Please refresh your browser using Ctrl + F5."
echo "================================================="
