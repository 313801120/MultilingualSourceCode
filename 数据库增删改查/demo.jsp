<%@ page language="java" import="java.util.*,java.io.*,java.text.*,java.security.*,javax.servlet.http.*,java.net.*" pageEncoding="gb2312" contentType = "text/html;charset=gb2312" %> 
<%@ page import="java.sql.*"%> 
<%
//ʹ��JSP���������� ���ݿ���ɾ�Ĳ�
String sqlServerHostIP = "localhost"; //SQL����IP��ַ��������������2008�汾ʹ��
String sqlServerUsername = "root"; //SQL���ݿ��û���
String sqlServerPassword = "root"; //SQL���ݿ��û�����
String sqlServerDatabaseName = "testdba1"; //SQL���ݿ���

 
//�������ݿ�
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
try{
	Connection connObj= DriverManager.getConnection("jdbc:mysql://"+ sqlServerHostIP +"/"+ sqlServerDatabaseName +"?user="+sqlServerUsername+"&password="+sqlServerPassword+"&useUnicode=true&characterEncoding=utf-8"); 
	Statement stmt=connObj.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 

	String sql="SELECT * FROM testtable";    
	String act=String.valueOf(request.getParameter("act"));  
	String id=String.valueOf(request.getParameter("id"));  
	String uname=String.valueOf(request.getParameter("uname"));  
	String btnTitle="�޸�";
	 
	if( id.equals("null") || id=="" ){
		id="";
		btnTitle="���"; 
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
		out.write(btnTitle + "�ɹ�,<a href='?'>�����ʾ�б�</a><hr>");
		
		out.close(); 
	}else if(act.equals("del")){  
		stmt.executeUpdate("delete from testTable where id=" + id);    
		out.write("ɾ��id("+id+")�ɹ�<hr>");
	}else if(act.equals("showEdit")){ 
		ResultSet rs = stmt.executeQuery("select * from testTable where id="+id);    
		if(rs.next()){
			uname=rs.getString("uname");
		}
	}
	
	out.write("<a href=\"?act=showAdd\">���һ���µ�</a>");
	out.write("<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"><tr><td>ID</td><td>����</td><td>����</td></tr>"); 
	
	ResultSet rs = stmt.executeQuery(sql);    
	while(rs.next()) { 
		String sId=rs.getString("id");
		out.write("<tr><td>"+sId+"</td><td>"+rs.getString("uname")+"</td>");
		out.write("<td><a href=\"?act=showEdit&id="+sId+"\">�޸�</a> | <a href=\"?act=del&id="+sId+"\">ɾ��</a></td></tr>");
	}
	out.write("</table>");
	if( act.equals("showAdd") || act.equals("showEdit") ){
		out.write("<form method=\"post\" action=\"?act=addEdit&id="+id+"\">����");
		out.write("<input type=\"text\" name='uname' value=\""+uname+"\"><input type=\"submit\" value=\""+btnTitle+"\" ></form>");
  	}
	
	
}catch(Exception e){
	out.write("<font color=red>Databases���ݿⲻ����</font>��<a href='Inc_jsp/install.jsp'>����������ݿ�</a>"); 
}

%>