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
echo "Downloading the pre-patched interface file..."
wget --no-check-certificate -qO node_list.htm https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/node_list.htm

# 5. Verify download success and AUTOMATICALLY RESTORE BACKUP on failure
if [ $? -ne 0 ]; then
    echo -e "${RED}"
    echo "#################################################"
    echo "                 DOWNLOAD ERROR                  "
    echo "#################################################"
    echo -e "${NC}"
    echo -e "${YELLOW}Reason:${NC} Failed to download node_list.htm from GitHub."
    echo ""
    echo -e "${RED}Possible Causes:${NC}"
    echo " - No internet connection on the router."
    echo " - GitHub raw servers are blocked/filtered by your ISP."
    echo " - Temporary DNS resolution issue."
    echo ""
    echo -e "${YELLOW}🚨 Automatic Recovery Active:${NC}"
    echo " Restoring the original system backup right now..."
    
    # Executing your backup restoration logic automatically
    BACKUP_PATH=$(find /usr/lib/lua/luci/view/passwall2/ -name "node_list.htm.bak" | head -n 1)
    if [ -n "$BACKUP_PATH" ]; then
        rm -f "${BACKUP_PATH%.bak}"
        mv "$BACKUP_PATH" "${BACKUP_PATH%.bak}"
        echo -e "${GREEN} -> Original backup successfully restored! Your system is safe.${NC}"
    else
        echo -e "${RED} -> [Critical] Backup file not found to restore.${NC}"
    fi
    
    echo -e "${RED}#################################################${NC}"
    echo ""
    exit 1
fi

# 6. Clean up LuCI Cache ONLY if download was 100% successful
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache

echo "================================================="
echo -e "${GREEN} PassWall 2 Test All URLs Patch Applied Successfully!${NC}"
echo " Please refresh your browser using Ctrl + F5."
echo "================================================="
