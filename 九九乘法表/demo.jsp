<%
//使用JSP语言来开发 九九乘法表 视频演示教程
int i,j;
for(i=1; i<=9; i++){
	for(j=1; j<i; j++){
		out.print(j+"*"+i+"="+(j*i)+"&nbsp; ");
	}
	out.print("<br>");
}
%>