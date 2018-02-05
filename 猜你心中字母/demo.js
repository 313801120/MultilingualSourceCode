//使用nodejs语言来开发 猜你心中字母
var http = require('http');
var querystring = require('querystring');
var url = require('url'); 
http.createServer(function (req, res) {	
 	res.writeHead(200, {'Content-Type': 'text/html;charset=utf-8'});    
    req.on('data', function (chunk){});		
    req.on('end', function(){
		var get=url.parse(req.url,true).query;
		var zm=get.url;
		var action=get.action;
		var nIndex=get.index;
		var s1=get.s1;
		var s2=get.s2;
		var s3=get.s3; 
		var sData="";
		if(zm==""||zm==undefined)zm="ABCDEFGHIJKLMNOPQRSTU";
		res.write("菜单：<a href='?'>重置</a><br>")
		if( action=="1" ){
			res.write(showSelectHtml(zm,2));
		}else if( '|2|3|4|'.indexOf('|'+action+'|')!=-1 ){
			nIndex=Math.round(nIndex);
			if( nIndex==1 ){
				sData=s2+s1+s3;
			}else if( nIndex==2 ){
				sData=s1+s2+s3;
			}else if( nIndex==3 ){
				sData=s1+s3+s2;
			}
			if( action=="4" ){  
				s=sData.substr(10,1)
				res.write("猜你心中记住的字母是不是 <b><font color=red>"+ s +"</font></b>");
			}else{ 
				res.write(showSelectHtml(sData,Math.round(action)+1));
			}
		}else{
			res.write("第1步：请心里记住一个字母：<a href='?action=1'>点击进入下一步</a><div style='letter-spacing:10px;font-size:16px'>" + zm + "</div>");
		}
						   
        res.end();
    });  				
}).listen(3000, function () {
    console.log("listen on port 3000");
});
function showSelectHtml(zm,action){
	var s1="",s2="",s3="",sData="",c="";
    for( i=1 ; i<=zm.length; i++){ 
		s=zm.substr(i-1,1)
        if( i % 3==1 ){
            s1=s1 + s;
        }else if( i % 3==2 ){
            s2=s2 + s;
        }else{
            s3=s3 + s;
        }
    } 
    sData="&s1="+s1+"&s2="+s2+"&s3="+s3;
	c='第'+ action +'步：选择你心里那个字母在哪一组<hr>'; 
    c+="第一组：" + s1 + " <a href='?action="+ action +"&index=1"+sData+"'>在这里</a><hr>";
    c+="第二组：" + s2 + " <a href='?action="+ action +"&index=2"+sData+"'>在这里</a><hr>";
    c+="第三组：" + s3 + " <a href='?action="+ action +"&index=3"+sData+"'>在这里</a><hr>"; 
	return c
}















