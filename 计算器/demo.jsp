<%@page language="java"  pageEncoding="gb2312" %>
<%
//ʹ��JSP���������� ������ ��Ƶ��ʾ�̳�
String c="1+1+2+3";
try{
	if(request.getParameter("act").equals("jisuan")){
		c=request.getParameter("c");
		out.write(c+"=<script>document.write(eval('"+c+"'))</script>");//���� js������
	}
}catch(Exception e){}


%> 
<form method="post" action="?act=jisuan">
��ʽ
<input name="c" type="text" value="<%=c%>" />
<input type="submit" name="button" value="����" />
</form>