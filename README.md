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

* **Multi-Version Stability:** The installer script (`patch.sh`) dynamically detects your LuCI architecture. Whether you are running the traditional interface or the modern 26.8.10+ client-side template matrix, it automatically downloads and seamlessly applies the perfectly compliant version using a Hybrid Payload Injection system.
* **Structural Proxy Protection:** Virtual and structural configurations such as **Shunt**, **Balancing (Load Balancer)**, and **URLTest** engines are allowed to participate in the ping sequence so you can monitor their live status. However, they are strictly excluded from the final automatic selection loop, shielding your core setup from accidental bulk deletion!
* **Accidental Selection Guard:** Once testing is finished, it automatically checks (ticks) timed-out or failed configurations based **ONLY** on the URL Test column result, keeping your healthy proxies safe.

### **Features**
* **Auto-Backup:** Automatically creates a safe factory backup of your original `node_list.htm` before applying changes, allowing for instant safe recovery.
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

*Note: Both methods will fully restore your original factory files, clean up the LuCI cache, and leave your router completely clean.*

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

* **پشتیبانی از ساختارهای جدید لوسی (Multi-Architecture):** اسکریپت نصب (`patch.sh`) به صورت هوشمند معماری روتر شما را اسکن می‌کند. چه از نسخه‌های سنتی لوسی استفاده کنید و چه از نسخه‌های مدرن (26.8.10 به بالا)، سیستم با استفاده از روش تزریق ترکیبی (Hybrid Injection) نسخه کاملاً سازگار را به نرمی اعمال می‌کند تا هیچ آسیبی به کدهای بومی روتر وارد نشود.
* **محافظت از کانفیگ‌های Shunt و لودبالانسر:** کانفیگ‌های مدیریتی و مجازی مانند **Shunt (شانت)**، **Balancing (لود بالانسر)** و **URLTest** اجازه دارند در زنجیره پینگ شرکت کنند تا وضعیت لایو آن‌ها را رصد کنید؛ اما سیستم به طور هوشمند آن‌ها را از لوپ تیک‌خوردن خودکار در پایان تست مستثنی می‌کند تا کانفیگ‌های اصلی شما به اشتباه حذف نشوند.
* **تفکیک هوشمند پروکسی‌های مرده:** پس از پایان فرآیند، سیستم تنها نودهایی را که در ستون URL Test وضعیت Timeout یا Error دارند تیک می‌زند تا بتوانید با دکمه حذف پیش‌فرض پسوال، آن‌ها را بدون آسیب به پروکسی‌های سالم یک‌جا پاک‌سازی کنید.

### **ویژگی‌ها**
- **بکاپ خودکار:** قبل از اعمال هرگونه تغییر، یک نسخه پشتیبان از فایل اصلی سیستم شما تهیه می‌کند تا بازگشت به حالت کارخانه در کسری از ثانیه ممکن باشد.
- **سازگار با تم تاریک (Dark Mode):** به سنسور تشخیص تم لوسی مجهز است تا در حالت روشن کاملاً هماهنگ و در حالت تاریک با رنگ زغالی مدرن و متن سفید کاملاً خوانا و شیک باشد.
- **اسکریپت ایمن (Idempotent):** اجرای چندباره‌ی این اسکریپت کاملاً بی‌خطر است؛ هرگز دکمه‌های تکراری نمی‌سازد و ساختار فعلی سیستم شما را به هم نمی‌ریزد.
- **سیستم خود-ترمیم (Rollback):** در صورت قطع ناگهانی اینترنت یا فیلترینگ در حین دانلود (با سقف انتظار ۲۰ ثانیه)، اسکریپت فوراً متوقف شده و بکاپ سیستم را برمی‌گرداند تا پنل روتر خراب نشود.
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

*توضیح: هر دو دستور فایل‌های اورجینال کارخانه را سر جایش برگردانده، کش لوسی را پاک می‌کنند و روتر شما را کاملاً تمیز تحویل می‌دهند.*

---

**⭐ حمایت از پروژه**

اگر این ابزار برای شما کاربردی بوده و به پاک‌سازی سریع کانفیگ‌های مرده کمک کرده است، لطفاً با دادن یک ستاره (Star) در بالای صفحه گیت‌هاب از پروژه حمایت کنید! همین یک کلیک ساده انگیزه بزرگی برای من جهت توسعه و انتشار پچ‌های بعدی در دنیای OpenWrt خواهد بود. از حمایت شما سپاسگزارم! 🙌

</details>

---
