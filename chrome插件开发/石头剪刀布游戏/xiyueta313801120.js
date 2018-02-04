var nSelf = 88,
	nComputer = 88,
	msg = "",
	recordList = "",
	sResult = "";
handleResult();

function handleResult(selfAction) {
	if (selfAction != "" && selfAction != undefined) {
		var computerAction = "布"
		var n = Math.round(Math.random() * 2) + 1
		if (n == 1) {
			computerAction = "石头"
		} else if (n == 2) {
			computerAction = "剪刀"
		}
		if ((selfAction == "石头" && computerAction == "剪刀") || (selfAction == "剪刀" && computerAction == "布") || (selfAction == "布" && computerAction == "石头")) {
			nSelf++;
			nComputer--
			sResult = "<font color=green>你赢了</font>"
		} else if ((selfAction == "石头" && computerAction == "布") || (selfAction == "剪刀" && computerAction == "石头") || (selfAction == "布" && computerAction == "剪刀")) {
			nSelf--;
			nComputer++
			sResult = "<font color=red>你输了</font>"
		} else {
			sResult = "<font color=gray>平局</font>"
		}

		msg = computerAction + " VS " + selfAction + "<br>" + sResult
		recordList += computerAction + " VS " + selfAction + "=" + sResult + "(" + nSelf + ")<br>"
	} else {
		msg = "VS"
		nSelf = 88;
		nComputer = 88;
		recordList = ""
	}
	document.getElementById("computer").innerHTML = "电脑<br>" + nComputer + "币"
	document.getElementById("self").innerHTML = "玩家<br>" + nSelf + "币"
	document.getElementById("vs").innerHTML = msg
	document.getElementById("record").innerHTML = recordList
}

var a = document.getElementsByTagName("a")
for (var i = 0; i <= a.length; i++) {
	var oBtn = a[i]
	oBtn.onclick = function(e) {
		var s = this.innerHTML
		if (s == "重置") s = ""
		handleResult(s)
	};
}