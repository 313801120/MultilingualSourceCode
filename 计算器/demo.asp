<%
'ʹ��ASP���������� ������ ��Ƶ��ʾ�̳�
dim c:c="1+1+2+3"
if request("act")="jisuan" then
	c=request("c")
	response.Write(c & "=" &eval(c))	'��һ�ַ���
	'�ڶ��ַ���
	response.Write("<hr>" & c & "=<script>document.write(eval('"&c&"'))</script>")
end if 
%>
<form method="post" action="?act=jisuan">
��ʽ<input type="text" name="c" value="<%=c%>" />
<input type="submit" value="����" />
</form>