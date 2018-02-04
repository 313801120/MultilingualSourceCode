<%@ page language="java" import="java.util.*,java.io.*,java.text.*,java.security.*,javax.servlet.http.*,java.net.*" pageEncoding="gb2312" contentType = "text/html;charset=gb2312" %> 
<%@ page import="java.sql.*"%> 
<%
//使用JSP语言来开发 数据库增删改查
String sqlServerHostIP = "localhost"; //SQL主机IP地址（服务器名）在2008版本使用
String sqlServerUsername = "root"; //SQL数据库用户名
String sqlServerPassword = "root"; //SQL数据库用户密码
String sqlServerDatabaseName = "testdba1"; //SQL数据库名

 
//链接数据库
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
try{
	Connection connObj= DriverManager.getConnection("jdbc:mysql://"+ sqlServerHostIP +"/"+ sqlServerDatabaseName +"?user="+sqlServerUsername+"&password="+sqlServerPassword+"&useUnicode=true&characterEncoding=utf-8"); 
	Statement stmt=connObj.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 

	String sql="SELECT * FROM testtable";    
	String act=String.valueOf(request.getParameter("act"));  
	String id=String.valueOf(request.getParameter("id"));  
	String uname=String.valueOf(request.getParameter("uname"));  
	String btnTitle="修改";
	 
	if( id.equals("null") || id=="" ){
		id="";
		btnTitle="添加"; 
	}
	if(uname.equals("null"))uname=""; 
	//out.write("<br>uname="+uname+"<br>");
	if(act.equals("addEdit")){
		if(id==""){
			sql="INSERT INTO testTable (uname) VALUES ('"+ uname +"')";
		}else{
			sql="UPDATE testTable set uname='"+ uname +"' where id=" + id;
		}
		//out.write("<br>sql="+sql+"<br>");  
		stmt.executeUpdate(sql);     
		out.write(btnTitle + "成功,<a href='?'>点击显示列表</a><hr>");
		
		out.close(); 
	}else if(act.equals("del")){  
		stmt.executeUpdate("delete from testTable where id=" + id);    
		out.write("删除id("+id+")成功<hr>");
	}else if(act.equals("showEdit")){ 
		ResultSet rs = stmt.executeQuery("select * from testTable where id="+id);    
		if(rs.next()){
			uname=rs.getString("uname");
		}
	}
	
	out.write("<a href=\"?act=showAdd\">添加一条新的</a>");
	out.write("<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>ID</td><td>姓名</td><td>操作</td></tr>"); 
	
	ResultSet rs = stmt.executeQuery(sql);    
	while(rs.next()) { 
		String sId=rs.getString("id");
		out.write("<tr><td>"+sId+"</td><td>"+rs.getString("uname")+"</td>");
		out.write("<td><a href=\"?act=showEdit&id="+sId+"\">修改</a> | <a href=\"?act=del&id="+sId+"\">删除</a></td></tr>");
	}
	out.write("</table>");
	if( act.equals("showAdd") || act.equals("showEdit") ){
		out.write("<form method=\"post\" action=\"?act=addEdit&id="+id+"\">姓名");
		out.write("<input type=\"text\" name='uname' value=\""+uname+"\"><input type=\"submit\" value=\""+btnTitle+"\" ></form>");
  	}
	
	
}catch(Exception e){
	out.write("<font color=red>Databases数据库不存在</font>：<a href='Inc_jsp/install.jsp'>点击创建数据库</a>"); 
}

%>