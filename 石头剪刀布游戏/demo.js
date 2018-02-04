//使用nodejs语言来开发 石头剪刀布游戏
var http = require('http');
var querystring = require('querystring');
var url = require('url'); 
var express=require('express')
var app=express() 
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session'); 
app.use(cookieParser());
app.use(session({
  secret: '12345',
  name: 'name',
  cookie: {maxAge: 60000},
  resave: false,
  saveUninitialized: true,
})); 
app.get('/',function(req,res){
	res.setHeader('Content-Type','text/html;charset=UTF-8'); 
	var get=url.parse(req.url,true).query; 
	var nSelf=88,nComputer=88,msg="VS",sResult; 
	if(get.action!="" && get.action!=undefined){
		nSelf=parseInt(get.nSelf);
		nComputer=parseInt(get.nComputer);
		var n=Math.round(Math.random()*2)+1;
		selfAction=handleSJB(get.action);
		computerAction=handleSJB(n)
		if( (selfAction=="石头"&&computerAction=="剪刀")||(selfAction=="剪刀"&&computerAction=="布")||(selfAction=="布"&&computerAction=="石头") ){
			nSelf++;nComputer--
			sResult="<font color=green>你赢了</font>"
		}else if( (selfAction=="石头"&&computerAction=="布")||(selfAction=="剪刀"&&computerAction=="石头")||(selfAction=="布"&&computerAction=="剪刀") ){
			nSelf--;nComputer++
			sResult="<font color=red>你输了</font>"
		}else{
			sResult="<font color=gray>平局</font>"
		}

		msg=computerAction + " VS " + selfAction + "<br>"+sResult
		req.session.recordList=req.session.recordList+computerAction + " VS " + selfAction + "=" +sResult + "("+nSelf+")<br>"
	}else{
		msg="VS"
		req.session.recordList=''
	} 
	res.write('<style>#computer{float:left;}');
	res.write('#vs{float:left;width:140px; font-weight:bold;text-align:center;}');
	res.write('#self{float:left;}');
	res.write('#action a{line-height:30px;padding:8px;}</style>');
	res.write('<div id="computer">电脑<br>'+nComputer+'币</div>');
	res.write('<div id="vs">'+msg+'</div>');
	res.write('<div id="self">玩家<br>'+nSelf+'币</div>');
	res.write('<div style="clear:both"></div>')
	res.write('<div id="action"><a href="?action=1&nComputer='+nComputer+'&nSelf='+nSelf+'">石头</a>');
	res.write('<a href="?action=2&nComputer='+nComputer+'&nSelf='+nSelf+'">剪刀</a>');
	res.write('<a href="?action=3&nComputer='+nComputer+'&nSelf='+nSelf+'">布</a>');
	res.write('<a href="?">重置</a></div><div id="record">'+req.session.recordList+'</div>');  
	res.end() 
})
function handleSJB(n){
	if(n==1){
		return '石头';	
	}else if(n==2){
		return '剪刀';	
	}else if(n==3){
		return '布';
	}
	return "";	
}  
app.listen(3001, function () {
    console.log("listen on port 3001");
});











