<%
//ʹ��JSP���������� �žų˷��� ��Ƶ��ʾ�̳�
int i,j;
for(i=1; i<=9; i++){
	for(j=1; j<i; j++){
		out.print(j+"*"+i+"="+(j*i)+"&nbsp; ");
	}
	out.print("<br>");
}
%>