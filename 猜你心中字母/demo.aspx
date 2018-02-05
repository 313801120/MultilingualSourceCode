<script runat="server" language="c#">
//使用.NET C#语言来开发 猜你心中字母
protected void Page_Load(object sender, EventArgs e){
	string zm="";string s="";string s1="";string s2="";string s3="";int i=0;string action="";string c="";string sData="";int nIndex=0;
	zm=Request["zm"]+"";
	action=Request["action"]+"";
	nIndex=Convert.ToInt32(Request["index"]);
	s1=Request["s1"]+"";
	s2=Request["s2"]+"";
	s3=Request["s3"]+"";
	if(zm=="")zm="ABCDEFGHIJKLMNOPQRSTU";
	Response.Write("菜单：<a href='?'>重置</a><br>");
	if(action=="1"){
		showSelectHtml(zm,2);
	}else if("|2|3|4|".IndexOf("|"+action+"|")!=-1){ 
		nIndex=Convert.ToInt32(nIndex);
		if( nIndex==1 ){
			sData=s2+s1+s3;
		}else if( nIndex==2 ){
			sData=s1+s2+s3;
		}else if( nIndex==3 ){
			sData=s1+s3+s2;
		}
		if(action=="4"){
			s=sData.Substring(10,1);
			Response.Write("猜你心中记住的字母是不是 <b><font color=red>"+ s +"</font></b>");
		}else{
			showSelectHtml(sData,Convert.ToInt32(action)+1);
		} 
	}else{
		Response.Write("第1步：请心里记住一个字母：<a href='?action=1'>点击进入下一步</a><div style='letter-spacing:10px;font-size:16px'>" + zm + "</div>");
	}
	
}
string showSelectHtml( string zm, int action){
    int i=0;string s="";string s1="";string s2="";string s3="";string sData="";
    for( i=1 ; i<= zm.Length; i++){ 
	s=zm.Substring(i-1,1);
        if( i % 3==1 ){
            s1=s1 + s;
        }else if( i % 3==2 ){
            s2=s2 + s;
        }else{
            s3=s3 + s;
        }
    }
    sData="&s1="+s1+"&s2="+s2+"&s3="+s3;
    Response.Write("第"+ action +"步：选择你心里那个字母在哪一组<hr>");
    Response.Write("第一组：" + s1 + " <a href='?action="+ action +"&index=1"+sData+"'>在这里</a><hr>");
    Response.Write("第二组：" + s2 + " <a href='?action="+ action +"&index=2"+sData+"'>在这里</a><hr>");
    Response.Write("第三组：" + s3 + " <a href='?action="+ action +"&index=3"+sData+"'>在这里</a><hr>");
    return "";
}
</script>























