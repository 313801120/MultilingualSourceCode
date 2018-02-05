console.log("九九乘法表 background run");
chrome.browserAction.onClicked.addListener(butClicked);

var isOnOff = 0;

function butClicked(tab) { 
	isOnOff = isOnOff == 1 ? 0 : 1
	chrome.tabs.sendMessage(tab.id, isOnOff);
}