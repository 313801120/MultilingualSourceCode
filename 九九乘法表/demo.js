//使用nodejs语言来开发 九九乘法表 视频演示教程
var http=require("http");
http.createServer(function(req,res){
	res.writeHead(200,{"Content-Type":"text/html"});
	var i,j;
	for(i=1; i<=9;i++){
		for(j=1; j<=i; j++){
			res.write(j+"*"+i+"="+(j*i)+"&nbsp; ");	
		}	
		res.write("<br>");
	}
}).listen(3000);
console.log("HTTP server is listening at port 3000.");