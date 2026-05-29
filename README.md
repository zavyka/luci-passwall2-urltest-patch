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
<details>
<summary><b>🇮🇷 توضیحات و راهنمای فارسی (برای باز شدن کلیک کنید)</b></summary>
درباره پروژه
زمانی که تعداد کانفیگ‌ها یا گره‌ها (Nodes) در افزونه PassWall 2 زیاد باشد، کلیک کردن روی دکمه‌ی Test تک‌تک آن‌ها برای سنجش پینگ و تاخیر زمان‌بر و خسته‌کننده خواهد بود.
این پچ به صورت خودکار یک دکمه‌ی اختصاصی و هوشمند به نام "Test All URLs" را درست در کنار دکمه‌های بالای جدول منوی Node List تزریق می‌کند. با فشردن این دکمه، تست پینگ تمامی کانفیگ‌ها به صورت زنجیره‌ای و پشت سر هم با یک تاخیر بهینه و ایمن (جهت جلوگیری از سنگین شدن مرورگر) اجرا می‌شود.
ویژگی‌ها
 بکاپ خودکار: قبل از اعمال هرگونه تغییر، یک نسخه پشتیبان از فایل اصلی سیستم شما (⁠node_list.htm.bak⁠) تهیه می‌کند.
 سازگار با انواع قالب‌ها: رنگ‌بندی دکمه به صورت خنثی طراحی شده تا در هر دو حالت روشن (Light) و تاریک (Dark) محیط لوسی کاملاً خوانا و شیک باشد.
 ضد خرابی (تکرار نشدن دکمه): این اسکریپت کاملاً ایمن است؛ یعنی اگر چندین بار هم اشتباهی اجرا شود، دکمه‌ی تکراری نمی‌سازد و ساختار صفحه را خراب نمی‌کند.
 نصب آسان: بدون نیاز به هیچ نرم‌افزار جانبی (مانند WinSCP) و فقط از طریق ترمینال.
🛠️ نحوه اجرا و نصب
محیط ترمینال SSH روتر خود (مانند نرم‌افزار PuTTY) را باز کرده، دستور زیر را به صورت کامل کپی و پیست کنید و کلید Enter را بزنید:
wget -qO- [https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh](https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh) | sh
🔄 مرحله آخر
پس از اجرای موفقیت‌آمیز دستور در ترمینال، وارد پنل وب روتر خود (منوی Node List در PassWall 2) شده و کلیدهای ترکیبی Ctrl + F5 را در مرورگر بزنید تا حافظه کش پاک شده و دکمه‌ی جدید ظاهر شود.
</details>
