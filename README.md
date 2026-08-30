# LuCI PassWall 2 URL Test Patch 🚀

A lightweight shell script to add a dedicated "Test All URLs" button to the PassWall 2 Node List interface in OpenWrt.

---

## 🌍 Language / زبان

Please choose your preferred language to see the description and installation guide:

لطفاً زبان مورد نظر خود را برای مشاهده توضیحات و راهنمای نصب انتخاب کنید:

---

<details>
<summary><b> 🇺🇸 English Description & Guide (Click to expand)</b></summary>

### **About the Project**
When you have a large number of nodes/configurations in the PassWall 2 plugin, clicking the "Test" button for each individual node to check the latency (ping) can be tedious and time-consuming.

This patch automatically injects a smart **"Test All URLs"** button directly into the nodes toolbar. With just a single click, it sequentially triggers the URL test for all available configurations with a safe, optimized delay to prevent UI freezing.

**Smart Multi-Architecture & Core Protection**

* **Universal Dynamic Injection:** The installer script (`patch.sh`) safely injects a lightweight payload directly into the interface without overwriting native system files, ensuring 100% immunity against upstream PassWall Lua core updates and preventing UI crashes.
* **Structural Proxy & Metadata Protection:** Virtual configurations such as **Shunt**, **Balancing (Load Balancer)**, and **URLTest** engines, as well as descriptive/traffic info nodes (e.g., remaining GB, expiration dates), are strictly shielded from accidental bulk selection!
* **Smart Health-Aware Selection:** If all proxies are healthy, the patch automatically notifies you without prompting for deletion. Confirmation and auto-ticking are strictly triggered only when dead or timed-out proxies exist.

### **Features**
* **Zero-Risk Injection:** Operates directly on the DOM layer without replacing system files, keeping native router firmware components completely untouched.
* **Theme Companion:** Fully equipped with a theme scheme detector that automatically shifts button styles to fit perfectly in both Light and high-contrast Dark LuCI layouts.
* **Idempotent Script:** Safe to run multiple times; it will never create duplicate buttons or break your existing structure.
* **One-Click Install:** No extra desktop tools (like WinSCP) required.
* **Network Guard:** Embedded with a 20-second timeout guard for slow connections and strict directory validation to prevent bricking incompatible systems.

### **🛠 Installation**
Open your router's terminal via SSH (e.g., PuTTY), paste the following command, and press Enter:

<pre><code>wget -qO- https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh | sh</code></pre>

### **🔄 Final Step & Re-testing Logic**
After running the script, go to your router's web interface, navigate to the PassWall 2 -> Node List page, and press **Ctrl + F5** in your browser to clear the browser cache and see the new button.

* **How to run a new test batch:** To ensure maximum stability and prevent parallel request conflicts in the background, the direct double-clicking of the button is locked. If you wish to execute a new fresh batch of pings, simply click PassWall's native **Reset** button to clear the view, and then you can hit **Test All URLs** again!

### **⏪ Uninstallation & Recovery**

If you ever need to remove the patch and restore your system to its factory layout, you can choose one of the following methods:

#### **Method 1: 🔌 Local Offline Method (Highly Recommended)**
You don't even need an internet connection! A dedicated local command is automatically generated on your router during installation. Simply type this word in your SSH terminal and hit Enter:

<pre><code>passwall2-urltest-uninstall</code></pre>

#### **Method 2: 🌐 Online Method**
Alternatively, you can run the uninstallation trigger directly from GitHub:

<pre><code>wget -qO- https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh | sh -s uninstall</code></pre>

*Note: Both methods will cleanly strip the injected code, purge the LuCI cache, and restore the factory layout without touching your configurations.*

---

**⭐ Support the Project**

If this patch made your life easier and helped you clean up dead configurations quickly, please give this repository a Star! It takes just one click but motivates me to build and maintain more OpenWrt patches in the future. Thank you for your support! 🙌

</details>

---

<details>
<summary><b> 🇮🇷 توضیحات و راهنمای فارسی (برای باز شدن کلیک کنید)</b></summary>

### **درباره پروژه**
زمانی که تعداد کانفیگ‌ها یا گره‌ها (Nodes) در افزونه PassWall 2 زیاد باشد، کلیک کردن روی دکمه‌ی Test تک‌تک آن‌ها برای سنجش پینگ و تاخیر، بسیار زمان‌بر و خسته‌کننده خواهد بود.

این پچ به صورت خودکار یک دکمه‌ی اختصاصی و هوشمند به نام **"Test All URLs"** را مستقیماً در نوار ابزار (Toolbar) تزریق می‌کند. با فشردن این دکمه، تست پینگ تمامی کانفیگ‌ها به صورت زنجیره‌ای و پشت سر هم با یک تاخیر بهینه و ایمن اجرا می‌شود تا از هنگ کردن رابط کاربری جلوگیری شود.

**پایداری چندنسخه‌ای و لایه حفاظتی نودهای مجازی**

* **تزریق داینامیک و سازگاری سراسری:** اسکریپت نصب (`patch.sh`) کدها را به صورت مستقیم و بدون بازنویسی فایل‌های بومی سیستم تزریق می‌کند. این ساختار پروژه را در برابر هرگونه تغییر در کدهای هسته لوسی یا آپدیت‌های پس‌وال کاملاً ایمن ساخته و مانع از کرش پنل روتر می‌شود.
* **محافظت از کانفیگ‌های ساختاری و نودهای حجمی:** کانفیگ‌های مدیریتی مانند **Shunt (شانت)**، **Balancing (لود بالانسر)** و **URLTest** به همراه ردیف‌های توضیحی (شامل ترافیک، حجم باقیمانده و تاریخ انقضا) به طور هوشمند از لوپ حذف خودکار مستثنی شده‌اند.
* **تشخیص هوشمند سلامت کامل:** در صورتی که تمام کانفیگ‌ها سالم باشند و پینگ بدهند، سیستم پیام سلامت نمایش داده و دیگر پیام هشدار حذف را باز نمی‌کند. فرآیند تیک زدن خودکار صرفاً در صورت وجود نود مرده فعال می‌شود.

### **ویژگی‌ها**
- **تزریق ایمن و بدون ریسک:** به جای جایگزینی کل فایل‌های سیستمی، مستقیماً در لایه رابط کاربری تزریق انجام می‌دهد و هیچ دستکاری در کدهای پایه روتر ایجاد نمی‌کند.
- **سازگار با تم تاریک (Dark Mode):** به سنسور تشخیص تم لوسی مجهز است تا در حالت روشن کاملاً هماهنگ و در حالت تاریک با رنگ زغالی مدرن و متن سفید کاملاً خوانا و شیک باشد.
- **اسکریپت ایمن (Idempotent):** اجرای چندباره‌ی این اسکریپت کاملاً بی‌خطر است؛ هرگز دکمه‌های تکراری نمی‌سازد و ساختار فعلی سیستم شما را به هم نمی‌ریزد.
- **سیستم بازگشت تمیز (Rollback):** در صورت نیاز به حذف، کدهای تزریق‌شده را به طور دقیق پاکسازی کرده و کش لوسی را نوسازی می‌کند.
- **نصب تک‌خطی:** به هیچ ابزار جانبی یا انتقال فایل دستی (مثل WinSCP) نیاز ندارد.

### **🛠 نحوه اجرا و نصب**
محیط ترمینال SSH روتر خود (مانند نرم‌افزار PuTTY) را باز کرده، دستور زیر را به صورت کامل کپی و پیست کنید و کلید Enter را بزنید:

<pre><code>wget -qO- https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh | sh</code></pre>

### **🔄 مرحله آخر و منطق تست مجدد**
پس از اجرای موفقیت‌آمیز دستور در ترمینال، وارد پنل وب روتر خود شده، به مسیر PassWall 2 -> Node List بروید و کلیدهای ترکیبی **Ctrl + F5** را در مرورگر بزنید تا حافظه کش پاک شده و دکمه‌ی جدید ظاهر شود.

* **نحوه گرفتن تست دوباره (Re-testing):** جهت وفاداری به پایداری فرانت‌اند و جلوگیری از تداخل درخواست‌های پینگ در پس‌زمینه، کلیک مجددِ مستقیم روی دکمه قفل است. برای اجرای یک تست تازه، کافیست یک‌بار دکمه‌ی فابریک **Reset (بازنشانی)** خودِ پسوال را فشار دهید تا سلول‌ها خنثی شوند؛ سپس می‌توانید دکمه‌ی **Test All URLs** را برای اسکن جدید بفشارید.

### **⏪ نحوه حذف پچ و بازگشت به حالت اورجینال (کارخانه)**

اگر به هر دلیلی خواستید پچ را کاملاً حذف کنید و سیستم به حالت اولیه کارخانه برگردد، می‌توانید از یکی از دو روش زیر استفاده کنید:

#### **روش اول: 🔌 حذف کاملاً آفلاین (پیشنهاد شده)**
حتی نیازی به اتصال اینترنت ندارید! در زمان نصب، یک دستور بومی و اختصاصی در حافظه روتر شما ساخته شده است. کافیست کلمه‌ی زیر را در ترمینال SSH بنویسید و اینتر بزنید:

<pre><code>passwall2-urltest-uninstall</code></pre>

#### **روش دوم: 🌐 حذف آنلاین از طریق گیت‌هاب**
همچنین می‌توانید برای اجرای عملیات حذف، دستور مستقیم زیر را وارد کنید:

<pre><code>wget -qO- https://raw.githubusercontent.com/zavyka/luci-passwall2-urltest-patch/main/patch.sh | sh -s uninstall</code></pre>

*توضیح: هر دو دستور کدهای تزریق‌شده را به صورت کامل پاکسازی کرده، کش لوسی را پاک می‌کنند و روتر را بدون دستکاری در تنظیمات به حالت اورجینال برمی‌گردانند.*

---

**⭐ حمایت از پروژه**

اگر این ابزار برای شما کاربردی بوده و به پاک‌سازی سریع کانفیگ‌های مرده کمک کرده است، لطفاً با دادن یک ستاره (Star) در بالای صفحه گیت‌هاب از پروژه حمایت کنید! همین یک کلیک ساده انگیزه بزرگی برای من جهت توسعه و انتشار پچ‌های بعدی در دنیای OpenWrt خواهد بود. از حمایت شما سپاسگزارم! 🙌

</details>

---
