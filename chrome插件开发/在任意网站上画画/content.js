//使用chrome插件来开发 在任意网站上画画
console.log("在任意网站上画画");

chrome.runtime.onMessage.addListener(goMessage);

function goMessage(message, sender, sendResponss) {
	if (message == 1) {
		console.log("在任意网站上画开启");
		document.body.style['userSelect'] = 'none';
		var div = document.createElement("div");
		//为div添加样式  
		var style = document.createAttribute("style");
		div.setAttributeNode(style);
		div.style.position = "fixed";
		div.style.top = "0";
		div.style.left = "0";
		div.style.zIndex = "9999";
		div.id = "divIdName";
		c = '<style type="text/css">#canvas {position:fixed;left:0;top:0;}</style>'
		c += '<canvas id="canvas" width="' + document.documentElement.clientWidth + 'px" height="' + document.documentElement.clientHeight + 'px">当前浏览不支付Canvas</canvas>'

		div.innerHTML = c
		document.getElementsByTagName("body").item(0).appendChild(div);

		var color = "#000"
		var canvas = document.getElementById("canvas");
		var context = canvas.getContext("2d");
		var s = {
			z: 2,
			e: "#000"
		}
		canvas.onmousedown = draw;

		function draw(e) {
			context.globalCompositeOperation = "source-over"
			var e = e || window.event;
			s.a = e.clientX;
			s.b = e.clientY;
			context.beginPath();
			context.moveTo(s.a, s.b);
			context.lineWidth = s.z;
			context.strokeStyle = s.e;
			document.onmousemove = function(e) {
				s.c = e.clientX;
				s.d = e.clientY;
				context.lineTo(s.c, s.d);
				context.stroke();
			}
			document.onmouseup = function(e) {
				document.onmousemove = ""
			}
		}
	} else {
		var el = document.getElementById('divIdName');
		el.parentNode.removeChild(el);
		console.log("在任意网站上画关闭");
	}
}