# LuCI PassWall 2 URL Test Patch 🚀

A lightweight shell script to add a dedicated "Test All URLs" button to the PassWall 2 Node List interface in OpenWrt.

---

## 🌍 Language / زبان

Please choose your preferred language to see the description and installation guide:
لطفاً زبان مورد نظر خود را برای مشاهده توضیحات و راهنمای نصب انتخاب کنید:

---

<details>
<summary><b> English Description & Guide (Click to expand)</b></summary>

### About the Project
When you have a large number of nodes/configurations in the PassWall 2 plugin, clicking the "Test" button for each individual node to check the latency (ping) can be tedious and time-consuming.

This patch automatically injects a smart **"Test All URLs"** button right next to the "Delete select nodes" button. With just a single click, it will sequentially trigger the URL test for all available configurations with a safe, optimized delay to prevent UI freezing.

⚡ Smart Auto-Selection Feature

Once the testing sequence is finished, a confirmation prompt will appear. With your permission, the script will automatically check (tick) all timed-out or failed configurations based **ONLY** on the URL Test column. This protects your other ping column metrics (like ICMP or TCPing) from accidental selection, allowing you to quickly review and delete all dead configs at once using the default delete button!

### Features
**Auto-Backup:** Automatically creates a backup of your original file (`node_list.htm.bak`) before applying any changes.
**Theme Companion:** Designed with a neutral color scheme that perfectly fits both Light and Dark LuCI themes.
**Idempotent Script:** Safe to run multiple times; it will never create duplicate buttons or break your existing structure.
**One-Click Install:** No extra software (like WinSCP) required.
**Network & Compatibility Walls:** Embedded with a 20-second timeout guard for slow networks and strict directory validation to prevent bricking incompatible systems.

### 🛠 Installation
Open your router's terminal via SSH (e.g., PuTTY), paste the following command, and press Enter:

<pre><code>wget -qO- https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh | sh</code></pre>

### 🔄 Final Step
After running the script, go to your router's web interface, navigate to the PassWall 2 -> Node List page, and press Ctrl + F5 in your browser to clear the browser cache and see the new button.

⏪ Uninstallation & Recovery

If you ever need to remove the patch and restore your system to its factory layout, you can choose one of the following methods:
Method 1: 🔌 Local Offline Method (Highly Recommended)

You don't even need an internet connection! A dedicated local command is automatically generated on your router during installation. Simply type this word in your SSH terminal and hit Enter:

<pre><code>passwall2-urltest-uninstall</code></pre>

Method 2: 🌐 Online Method
Alternatively, you can run the uninstallation trigger directly from GitHub

<pre><code>wget -qO- [https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh](https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh) | sh -s uninstall</code></pre>

Note: Both methods will restore your original factory backup, clean up the LuCI cache, and leave your router completely clean.


⭐ Support the Project

If this patch made your life easier and helped you clean up dead configurations quickly, please give this repository a Star! It takes just one click but motivates me to build and maintain more OpenWrt patches in the future. Thank you for your support! 🙌

</details>

---

<details>
<summary><b> توضیحات و راهنمای فارسی (برای باز شدن کلیک کنید)</b></summary>

### درباره پروژه
زمانی که تعداد کانفیگ‌ها یا گره‌ها (Nodes) در افزونه PassWall 2 زیاد باشد، کلیک کردن روی دکمه‌ی Test تک‌تک آن‌ها برای سنجش پینگ و تاخیر زمان‌بر و خسته‌کننده خواهد بود.

این پچ به صورت خودکار یک دکمه‌ی اختصاصی و هوشمند به نام "Test All URLs" را درست در کنار دکمه‌های بالای جدول منوی Node List تزریق می‌کند. با فشردن این دکمه، تست پینگ تمامی کانفیگ‌ها به صورت زنجیره‌ای و پشت سر هم با یک تاخیر بهینه و ایمن (جهت جلوگیری از سنگین شدن مرورگر) اجرا می‌شود.

⚡ قابلیت هوشمند انتخاب خودکار کانفیگ‌های مرده

پس از اتمام زنجیره تست‌ها، یک پنجره تایید به شما نشان داده می‌شود که در صورت موافقت، اسکریپت به طور کاملاً خودکار تمام کانفیگ‌هایی را که در ستون اختصاصی URL Test وضعیت آن‌ها Timeout یا Error شده است تیک می‌زند. این تفکیک هوشمند باعث می‌شود وضعیت پینگ‌های دیگر (مانند ICMP یا TCPing) باعث تیک خوردن اشتباهی کانفیگ‌های سالم شما نشود؛ در نتیجه می‌توانید تنها با یک کلیک روی دکمه حذف پیش‌فرض پسوال تمامی کانفیگ‌های مرده را یک‌جا پاک‌سازی کنید!

### ویژگی‌ها
- بکاپ خودکار: قبل از اعمال هرگونه تغییر، یک نسخه پشتیبان از فایل اصلی سیستم شما (node_list.htm.bak) تهیه می‌کند و در اجراهای بعدی هرگز آن را بازنویسی نمی کند.
- سازگار با انواع قالب‌ها: رنگ‌بندی دکمه به صورت خنثی طراحی شده تا در هر دو حالت روشن (Light) و تاریک (Dark) محیط لوسی کاملاً خوانا و شیک باشد.
- سیستم خود-ترمیم (Rollback): در صورت قطع ناگهانی اینترنت یا فیلترینگ در حین دانلود (با سقف انتظار ۲۰ ثانیه)، اسکریپت فوراً متوقف شده و بکاپ سیستم را برمی‌گرداند تا پنل روتر خراب نشود.
- سازگاری: اگر ساختار فریمور یا نسخه پسوال شما همخوانی نداشته باشد، اسکریپت بدون دستکاری روتر هوشمندانه متوقف می‌شود.

### 🛠 نحوه اجرا و نصب
محیط ترمینال SSH روتر خود (مانند نرم‌افزار PuTTY) را باز کرده، دستور زیر را به صورت کامل copy و paste کنید و کلید Enter را بزنید:

<pre><code>wget -qO- https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh | sh</code></pre>

### 🔄 مرحله آخر
پس از اجرای موفقیت‌آمیز دستور در ترمینال، وارد پنل وب روتر خود (منوی Node List در PassWall 2) شده و کلیدهای ترکیبی Ctrl + F5 را در مرورگر بزنید تا حافظه کش پاک شده و دکمه‌ی جدید ظاهر شود.

⏪ نحوه حذف پچ و بازگشت به حالت اورجینال (کارخانه)

اگر به هر دلیلی خواستید پچ را کاملاً حذف کنید و سیستم به حالت اولیه کارخانه برگردد، می‌توانید از یکی از دو روش زیر استفاده کنید:

روش اول: 🔌 حذف کاملاً آفلاین (پیشنهاد شده)

حتی نیازی به اتصال اینترنت ندارید! در زمان نصب، یک دستور بومی و اختصاصی در حافظه روتر شما ساخته شده است. کافیست کلمه‌ی زیر را در ترمینال SSH بنویسید و اینتر بزنید:

<pre><code>passwall2-urltest-uninstall</code></pre>

روش دوم: 🌐 حذف آنلاین از طریق گیت‌هاب

همچنین می‌توانید در صورت متصل بودن اینترنت، دستور مستقیم زیر را برای حذف اجرا کنید:

<pre><code>wget -qO- [https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh](https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh) | sh -s uninstall</code></pre>

توضیح: هر دو دستور فایل اصلی سیستم شما را سر جایش برگردانده، کش لوسی را به جهت اعمال فوری تغییرات پاک می‌کنند و هیچ فایل اضافه‌ای روی روتر باقی نمی‌گذارند.


⭐ حمایت از پروژه

اگر این ابزار برای شما کاربردی بوده و به پاک‌سازی سریع کانفیگ‌های مرده کمک کرده است، لطفاً با دادن یک ستاره (Star) در بالای صفحه گیت‌هاب از پروژه حمایت کنید! همین یک کلیک ساده انگیزه بزرگی برای من جهت توسعه و انتشار پچ‌های بعدی خواهد بود. 🙌


</details>

---
