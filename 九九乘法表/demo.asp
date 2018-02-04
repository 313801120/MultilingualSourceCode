<%
'使用ASP语言来开发 九九乘法表 视频演示教程
dim i,j
for i=1 to 9
	for j=1 to i
		response.Write(j & "*" & i & "=" & (i*j) & "&nbsp; " )
	next
	response.Write("<br>")
next 
%>