#!/bin/sh

# Precise absolute path to the target file
TARGET_PATH="/usr/lib/lua/luci/view/passwall2/node_list/node_list.htm"
UNINSTALLER_PATH="/usr/bin/passwall2-urltest-uninstall"

# Color constants for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0;m' # No Color

# =================================================
#  BLOCK 1: SMART UNINSTALL SYSTEM (ONLINE ARGUMENT)
# =================================================
if [ "$1" = "uninstall" ]; then
    echo "Initiating Uninstallation Process..."
    if [ -f "${TARGET_PATH}.bak" ]; then
        rm -f "$TARGET_PATH"
        mv "${TARGET_PATH}.bak" "$TARGET_PATH"
        rm -f /tmp/luci-indexcache /tmp/luci-modulecache
        rm -f "$UNINSTALLER_PATH"
        
        echo -e "${GREEN}=================================================${NC}"
        echo -e "${GREEN} Patch successfully removed!${NC}"
        echo -e " System restored to the original factory layout."
        echo " Please refresh your browser using Ctrl + F5."
        echo -e "${GREEN}=================================================${NC}"
        exit 0
    else
        echo -e "${RED}Error: Original backup file (.bak) not found.${NC}"
        exit 1
    fi
fi

# =================================================
#  BLOCK 2: STANDARD SAFE INSTALLATION SYSTEM
# =================================================
echo "Checking system compatibility..."

# Strict compatibility wall with dedicated Error Block Layout
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

# Safely navigate to the directory now that we know the file exists
cd /usr/lib/lua/luci/view/passwall2/node_list/

# Smart Backup Logic - Protect the original untampered file
if [ ! -f "node_list.htm.bak" ]; then
    cp node_list.htm node_list.htm.bak
    echo "Original system backup created successfully: node_list.htm.bak"
else
    echo -e "${YELLOW}Notice:${NC} An existing original backup was found. Skipping backup modification to protect your original files."
fi

# Download the pre-patched file from GitHub repository directly
echo "Downloading the pre-patched interface file..."
wget --no-check-certificate -qO node_list.htm https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/node_list.htm

# Verify download success and AUTOMATICALLY RESTORE BACKUP on failure
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

# Clean up LuCI Cache ONLY if download was 100% successful
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache

# =================================================
#  BLOCK 3: CREATING PERMANENT OFFLINE UNINSTALLER
# =================================================
# Deploying the uninstaller with a unique, project-specific name to prevent any future conflict
cat << 'EOF' > /usr/bin/passwall2-urltest-uninstall
#!/bin/sh
TARGET_PATH="/usr/lib/lua/luci/view/passwall2/node_list/node_list.htm"
UNINSTALLER_PATH="/usr/bin/passwall2-urltest-uninstall"

if [ -f "${TARGET_PATH}.bak" ]; then
    rm -f "$TARGET_PATH"
    mv "${TARGET_PATH}.bak" "$TARGET_PATH"
    rm -f /tmp/luci-indexcache /tmp/luci-modulecache
    rm -f "$UNINSTALLER_PATH"
    echo -e "\033[0;32m=================================================\033[0;m"
    echo -e "\033[0;32mPassWall 2 URL-Test Patch removed successfully!\033[0;m"
    echo -e "System restored to the original factory layout."
    echo -e "Please refresh your browser using Ctrl + F5."
    echo -e "\033[0;32m=================================================\033[0;m"
else
    echo -e "\033[0;31mError: Backup file (.bak) not found! Cannot restore.\033[0;m"
fi
EOF

# Grant absolute execution privileges to the newly deployed offline command
chmod +x /usr/bin/passwall2-urltest-uninstall

echo "================================================="
echo -e "${GREEN} PassWall 2 Test All URLs Patch Applied Successfully!${NC}"
echo -e " Local offline uninstaller created: ${YELLOW}passwall2-urltest-uninstall${NC}"
echo " Please refresh your browser using Ctrl + F5."
echo "================================================="
