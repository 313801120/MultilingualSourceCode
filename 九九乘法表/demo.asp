<%
'ʹ��ASP���������� �žų˷��� ��Ƶ��ʾ�̳�
dim i,j
for i=1 to 9
	for j=1 to i
		response.Write(j & "*" & i & "=" & (i*j) & "&nbsp; " )
	next
	response.Write("<br>")
next 
%>