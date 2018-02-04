<script runat="server" language="c#">
//使用.NET C#语言来开发 九九乘法表 视频演示教程
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