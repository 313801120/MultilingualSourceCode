<script runat="server" language="c#">
//ʹ��.NET C#���������� �žų˷��� ��Ƶ��ʾ�̳�
protected void Page_Load(object sender, EventArgs e){
	int i,j;
	for(i=1; i<=9; i++){
		for(j=1; j<=i; j++){
			Response.Write(j+"*"+i+"="+(j*i)+"&nbsp;");
		}
		Response.Write("<br>");
	}
}
</script>