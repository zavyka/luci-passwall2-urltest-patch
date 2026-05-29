# LuCI PassWall 2 URL Test Patch 🚀

A lightweight shell script to add a dedicated "Test All URLs" button to the PassWall 2 Node List interface in OpenWrt.

---

## 🌍 Language / زبان

Please choose your preferred language to see the description and installation guide:
لطفاً زبان مورد نظر خود را برای مشاهده توضیحات و راهنمای نصب انتخاب کنید:

---

<details>
<summary><b>🇬🇧 English Description & Guide (Click to expand)</b></summary>

### About the Project
When you have a large number of nodes/configurations in the PassWall 2 plugin, clicking the "Test" button for each individual node to check the latency (ping) can be tedious and time-consuming. 

This patch automatically injects a smart "Test All URLs" button right next to the "Delete select nodes" button. With just a single click, it will sequentially trigger the URL test for all available configurations with a safe, optimized delay to prevent UI freezing.

### Features
- Auto-Backup: Automatically creates a backup of your original file (`node_list.htm.bak`) before applying any changes.
- Theme Companion: Designed with a neutral color scheme that perfectly fits both Light and Dark LuCI themes.
- Idempotent Script: Safe to run multiple times; it will never create duplicate buttons or break your existing structure.
- One-Click Install: No extra software (like WinSCP) required.

### 🛠️ Installation
Open your router's terminal via SSH (e.g., PuTTY), paste the following command, and press Enter:

```bash
wget -qO- [https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh](https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh) | sh

🔄 Final Step
After running the script, go to your router's web interface, navigate to the PassWall 2 -> Node List page, and press Ctrl + F5 in your browser to clear the browser cache and see the new button.
</details>
