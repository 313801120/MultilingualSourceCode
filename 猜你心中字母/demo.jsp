<%@ page language="java" pageEncoding="utf-8"%><%! 
//使用JSP语言来开发 猜你心中字母
String showSelectHtml( String zm, int action){
	int i=0;String s="";String s1="";String s2="";String s3="";String sData="";
	for( i=0 ; i< zm.length(); i++){
		try{        
			s=zm.substring(i,i+1);
		}catch(Exception e){}
		if( (i+1) % 3==1 ){
			s1=s1 + s;
		}else if( (i+1) % 3==2 ){
			s2=s2 + s;
		}else{
			s3=s3 + s;
		} 
	}
	sData="&s1="+s1+"&s2="+s2+"&s3="+s3; 
	String c="第"+ action +"步：选择你心里那个字母在哪一组<hr>"; 
	c+="第一组：" + s1 + " <a href='?action="+ action +"&index=1"+sData+"'>在这里</a><hr>"; 
	c+="第二组：" + s2 + " <a href='?action="+ action +"&index=2"+sData+"'>在这里</a><hr>"; 
	c+="第三组：" + s3 + " <a href='?action="+ action +"&index=3"+sData+"'>在这里</a><hr>"; 
	return c;
}
%>
<%
String zm="";String s="";String s1="";String s2="";String s3="";int i=0;String action="";String sData="";int nIndex=0;
zm=String.valueOf(request.getParameter("zm"));
action=String.valueOf(request.getParameter("action")); 
s1=String.valueOf(request.getParameter("s1"));
s2=String.valueOf(request.getParameter("s2"));
s3=String.valueOf(request.getParameter("s3"));
s=request.getParameter("index");
if(s!=null)nIndex=Integer.parseInt(s);
if(zm=="null")zm="ABCDEFGHIJKLMNOPQRSTU";
out.print("菜单：<a href='?'>重置</a><br>");
if( action.equals("1" )){
	out.print(showSelectHtml(zm,2));
}else if( "|2|3|4|".indexOf("|"+action+"|")!=-1 ){ 
	if( nIndex==1 ){
		sData=s2+s1+s3;
	}else if( nIndex==2 ){
		sData=s1+s2+s3;
	}else if( nIndex==3 ){
		sData=s1+s3+s2;
	}
	if( action.equals("4" )){
		s=sData.substring(10,11);
		out.print("猜你心中记住的字母是不是 <b><font color=red>"+ s +"</font></b>");
	}else{ 
		out.print(showSelectHtml(sData,Integer.parseInt(action)+1));
	}
}else{
	out.print("第1步：请心里记住一个字母：<a href='?action=1'>点击进入下一步</a><div style='letter-spacing:10px;font-size:16px'>" + zm + "</div>");     
}  
%>





















 