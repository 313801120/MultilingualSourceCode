<script runat="server" language="c#">
//ʹ��.NET C#���������� ������ ��Ƶ��ʾ�̳�
string c="1+1+2+3";
protected void Page_Load(object sender, EventArgs e){ 
	if( Request["act"]=="jisuan" ){
		c=Request["c"];
		MSScriptControl.ScriptControlClass sc = new MSScriptControl.ScriptControlClass();//����MSScriptControl
		sc.Language = "javascript";  
		object obj = sc.Eval(c);  
		Response.Write(c +"="+ obj);		//��һ�ַ���
		Response.Write("<hr>"+c+"=<script>document.write(eval('"+c+"'))</"+"script>");  	//�ڶ��ַ���
	} 
}
</script>
<form id="form1" name="form1" method="post" action="?act=jisuan">
��ʽ
<input name="c" type="text"value="<%=c%>" />
<input type="submit" name="button" id="button" value="����" />
</form>