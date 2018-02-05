<%@page language="java"  pageEncoding="gb2312" %>
<%
//使用JSP语言来开发 计算器 视频演示教程
String c="1+1+2+3";
try{
	if(request.getParameter("act").equals("jisuan")){
		c=request.getParameter("c");
		out.write(c+"=<script>document.write(eval('"+c+"'))</script>");//调用 js来处理
	}
}catch(Exception e){}


%> 
<form method="post" action="?act=jisuan">
公式
<input name="c" type="text" value="<%=c%>" />
<input type="submit" name="button" value="计算" />
</form>