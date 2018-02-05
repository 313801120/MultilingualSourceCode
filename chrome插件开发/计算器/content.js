//使用chrome插件来开发 计算器
console.log("计算器");

chrome.runtime.onMessage.addListener(goMessage);

function goMessage(message, sender, sendResponss) { 
	if (message == 1) {
		console.log("计算器开启");
		var div = document.createElement("div");
		//为div添加样式  
		var style = document.createAttribute("style");
		div.setAttributeNode(style);
		div.style.backgroundColor = "#FFD7D7";
		div.style.borderWidth = "2px";
		div.style.borderColor = "#000";
		div.style.borderStyle = "solid";
		div.style.lineHeight = "26px";
		div.style.padding = "4px";
		div.style.width = "400px";
		div.style.height = "100px";
		div.style.textAlign = "left"; 
		div.style.position = "fixed";
		div.style.top = "0";
		div.style.left = "0";
		div.style.zIndex = "9999";
		div.id = "divIdName";
		var s = 'javascript:var c=document.getElementById("c").value;document.getElementById("msg").innerHTML=c+"="+eval(c)'
		div.innerHTML = '<div id="msg"></div>公式<input type="text" id="c" name="c" value="1+1+2+3" /><input type="button" value="计算" onclick=\'' + s + '\' />'
		document.getElementsByTagName("body").item(0).appendChild(div);
	} else {
		var el = document.getElementById('divIdName');
		el.parentNode.removeChild(el);
		console.log("计算器关闭");
	}
}