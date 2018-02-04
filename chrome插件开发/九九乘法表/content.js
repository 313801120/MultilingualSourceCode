//使用chrome插件来开发 九九乘法表
console.log("九九乘法表");
chrome.runtime.onMessage.addListener(goMessage);

function goMessage(message, sender, sendResponss) { 
	if (message == 1) {
		console.log("九九乘法表开启");
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
		div.style.width = "600px";
		div.style.height = "250px";
		div.style.textAlign = "left"; 
		div.style.position = "fixed";
		div.style.top = "0";
		div.style.left = "0";
		div.style.zIndex = "9999";
		div.id = "divIdName";

		var i, j, c = "";
		for (i = 1; i <= 9; i++) {
			for (j = 1; j <= i; j++) {
				c += j + "*" + i + "=" + (j * i) + "&nbsp; ";
			}
			c += "<br>";
		}

		div.innerHTML = c
		document.getElementsByTagName("body").item(0).appendChild(div);
	} else {
		var el = document.getElementById('divIdName');
		el.parentNode.removeChild(el);
		console.log("九九乘法表关闭");
	}
}













