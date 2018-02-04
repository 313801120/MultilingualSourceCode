<%
'使用ASP语言来开发 计算器 视频演示教程
dim c:c="1+1+2+3"
if request("act")="jisuan" then
	c=request("c")
	response.Write(c & "=" &eval(c))	'第一种方法
	'第二种方法
	response.Write("<hr>" & c & "=<script>document.write(eval('"&c&"'))</script>")
end if 
%>
<form method="post" action="?act=jisuan">
公式<input type="text" name="c" value="<%=c%>" />
<input type="submit" value="计算" />
</form>