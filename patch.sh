#!/bin/sh

# 1. Navigate to the directory and create a backup of the original file
cd /usr/lib/lua/luci/view/passwall2/node_list/
[ -f node_list.htm.bak ] || cp node_list.htm node_list.htm.bak

# 2. Create a temporary JavaScript file for safe code injection
cat << 'EOF' > patch.js
function runAllUrlTests(){let d=0;document.querySelectorAll('table tr, .tr').forEach(r=>{let c=r.querySelectorAll('td, .td');if(c.length>4){c.forEach(el=>{let t=el.querySelector('a, button, [onclick], .cbi-button')||el;if(el.textContent.includes('Test')){setTimeout(()=>{t.click();let e=new MouseEvent('click',{bubbles:true,cancelable:true});t.dispatchEvent(e)},d);d+=150}})}})}
EOF

# 3. Inject the JavaScript function before the closing script tag
sed -i '/<\/script>/i \\n' node_list.htm
sed -i '/<\/script>/e cat patch.js' node_list.htm

# 4. Append the HTML button and DOM manipulation script to the end of the file
cat << 'EOF' >> node_list.htm

<script type="text/javascript">
 window.addEventListener('DOMContentLoaded', (event) => {
  var deleteBtn = document.querySelector('input[onclick="delete_select_nodes()"]');
  if(deleteBtn && !document.querySelector('input[value="Test All URLs"]')) {
   var testAllBtn = document.createElement('input');
   testAllBtn.type = 'button';
   testAllBtn.className = 'cbi-button cbi-button-apply';
   testAllBtn.value = 'Test All URLs';
   testAllBtn.style = 'margin-left: 5px; background-color: #e1e1e1; color: #333333; border: 1px solid #ccc; font-weight: bold;';
   testAllBtn.onclick = runAllUrlTests;
   deleteBtn.parentNode.insertBefore(testAllBtn, deleteBtn.nextSibling);
  }
 });
</script>
EOF

# 5. Clean up temporary files and clear LuCI cache to apply changes
rm -f patch.js
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache

echo "================================================="
echo " PassWall 2 Test All URLs Patch Applied Successfully!"
echo " Please refresh your browser using Ctrl + F5."
echo "================================================="
