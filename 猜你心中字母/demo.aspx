<script runat="server" language="c#">
//ʹ��.NET C#���������� ����������ĸ
protected void Page_Load(object sender, EventArgs e){
	string zm="";string s="";string s1="";string s2="";string s3="";int i=0;string action="";string c="";string sData="";int nIndex=0;
	zm=Request["zm"]+"";
	action=Request["action"]+"";
	nIndex=Convert.ToInt32(Request["index"]);
	s1=Request["s1"]+"";
	s2=Request["s2"]+"";
	s3=Request["s3"]+"";
	if(zm=="")zm="ABCDEFGHIJKLMNOPQRSTU";
	Response.Write("�˵���<a href='?'>����</a><br>");
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
			Response.Write("�������м�ס����ĸ�ǲ��� <b><font color=red>"+ s +"</font></b>");
		}else{
			showSelectHtml(sData,Convert.ToInt32(action)+1);
		} 
	}else{
		Response.Write("��1�����������סһ����ĸ��<a href='?action=1'>���������һ��</a><div style='letter-spacing:10px;font-size:16px'>" + zm + "</div>");
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
    Response.Write("��"+ action +"����ѡ���������Ǹ���ĸ����һ��<hr>");
    Response.Write("��һ�飺" + s1 + " <a href='?action="+ action +"&index=1"+sData+"'>������</a><hr>");
    Response.Write("�ڶ��飺" + s2 + " <a href='?action="+ action +"&index=2"+sData+"'>������</a><hr>");
    Response.Write("�����飺" + s3 + " <a href='?action="+ action +"&index=3"+sData+"'>������</a><hr>");
    return "";
}
</script>























