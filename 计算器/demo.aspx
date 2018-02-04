<script runat="server" language="c#">
//使用.NET C#语言来开发 计算器 视频演示教程
string c="1+1+2+3";
protected void Page_Load(object sender, EventArgs e){ 
	if( Request["act"]=="jisuan" ){
		c=Request["c"];
		MSScriptControl.ScriptControlClass sc = new MSScriptControl.ScriptControlClass();//引用MSScriptControl
		sc.Language = "javascript";  
		object obj = sc.Eval(c);  
		Response.Write(c +"="+ obj);		//第一种方法
		Response.Write("<hr>"+c+"=<script>document.write(eval('"+c+"'))</"+"script>");  	//第二种方法
	} 
}
</script>
<form id="form1" name="form1" method="post" action="?act=jisuan">
公式
<input name="c" type="text"value="<%=c%>" />
<input type="submit" name="button" id="button" value="计算" />
</form>