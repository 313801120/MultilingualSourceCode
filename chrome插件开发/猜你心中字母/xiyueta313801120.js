//使用JS语言来开发 猜你心中字母 
var s1 = "",
	s2 = "",
	s3 = "";
showClick("", "", "", "", "")

function showClick(action, nIndex, zm, s1, s2, s3) {
	if (zm == '' || zm == undefined) zm = 'ABCDEFGHIJKLMNOPQRSTU';
	if (action == '1') {
		showSelectHtml(zm, 2);
	} else if ('|2|3|4|'.indexOf('|' + action + '|') != -1) {
		nIndex = Math.round(nIndex);
		if (nIndex == 1) {
			sData = s2 + s1 + s3;
		} else if (nIndex == 2) {
			sData = s1 + s2 + s3;
		} else if (nIndex == 3) {
			sData = s1 + s3 + s2;
		}
		if (action == '4') {
			s = sData.substr(10, 1)
			document.getElementById("msg").innerHTML = '猜你心中记住的字母是不是 <b><font color=red>' + s + '</font></b>';
		} else {
			showSelectHtml(sData, Math.round(action) + 1);
		}
	} else {
		document.getElementById("msg").innerHTML = '<div style="width:444px">第1步：请心里记住一个字母：<a href=\'#\'>点击进入下一步</a><div style=\'letter-spacing:10px;font-size:16px\'>' + zm + '</div></div>'
		handleAAction()
	}
}

function showSelectHtml(zm, action) {
	s1 = ""
	s2 = ""
	s3 = ""
	for (i = 1; i <= zm.length; i++) {
		s = zm.substr(i - 1, 1)
		if (i % 3 == 1) {
			s1 = s1 + s;
		} else if (i % 3 == 2) {
			s2 = s2 + s;
		} else {
			s3 = s3 + s;
		}
	}
	c = '第' + action + '步：选择你心里那个字母在哪一组 <a href="#">重置</a><hr>';
	c += '第一组：' + s1 + ' <a href="#" name="' + action + '" title="1">在这里</a><hr>';
	c += '第二组：' + s2 + ' <a href="#" name="' + action + '" title="2">在这里</a><hr>';
	c += '第三组：' + s3 + ' <a href="#" name="' + action + '" title="3">在这里</a><hr>';
	document.getElementById("msg").innerHTML = '<div style="width:444px">' + c + '</div>'
	handleAAction()
}
//处理A动作
function handleAAction() {
	var a = document.getElementsByTagName("a")
	for (var i = 0; i <= a.length; i++) {
		var oBtn = a[i]
		oBtn.onclick = function(e) {
			var s = this.innerHTML
			if (s == "点击进入下一步") {
				showClick(1)
			} else if (s == "在这里") {
				var action = this.name
				var nIndex = parseInt(this.title)
				showClick(action, nIndex, "", s1, s2, s3)
			} else if (s == "重置") {
				showClick("", "", "", "", "")
			} else {
				alert("no")
			}
		};
	}
}