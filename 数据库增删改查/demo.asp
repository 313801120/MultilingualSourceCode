<%
'ʹ��ASP���������� ���ݿ���ɾ�Ĳ�
dim conn,rs,fso,sql,isAccess:isAccess=true
dim MDBPath:MDBPath=Server.MapPath("./testDB.mdb")
dim id,uname,act,btnTitle
act=request("act")
id=request("id")
uname=request("uname")
btnTitle="���"
if id<>"" then btnTitle="�޸�"
set fso = createObject("Scripting.FileSystemObject")
'���ݿⲻ�����򴴽�
if  fso.fileExists(MDBPath)=false then 
    set conn = createObject("ADOX.Catalog")
    conn.create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & MDBPath) 
	isAccess=false
end if
Set conn = CreateObject("Adodb.Connection")
Set rs = CreateObject("Adodb.RecordSet")
conn.Open "Provider = Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database PassWord='';Data Source = " & MDBPath   
if isAccess=false then
	sql = "Create Table testTable (Id Int Identity(0,1) Primary Key,"  
	sql = sql & "uname Text Default """")"                                    
	conn.execute(sql) 
end if

if act="addEdit" then
	if id="" then
		sql="INSERT INTO testTable (uname) VALUES ('"& uname &"')"
	else
		sql="UPDATE testTable set uname='"& uname &"' where id=" & id
	end if
	conn.execute(sql)
	response.Write(btnTitle & "�ɹ�<hr>")
elseif act="del" then
	conn.execute("delete * from testTable where id=" & id)
	response.Write("ɾ���ɹ�<hr>")
elseif act="showEdit" then
	rs.open"select * from testTable where id=" &id,conn,1,1
	if not rs.eof then
		uname=rs("uname")
	end if:rs.close
end if
%> 
<a href="?act=showAdd">���һ���µ�</a>   
<table width="100%" border="1" cellspacing="0" cellpadding="0"> 
<tr><td>ID</td><td>����</td><td>����</td></tr>
<%
rs.open"select * from testTable",conn,1,1
while not rs.eof
%>
<tr>
<td><%=rs("id")%></td>
<td><%=rs("uname")%></td>
<td><a href="?act=showEdit&id=<%=rs("id")%>">�޸�</a> | <a href="?act=del&id=<%=rs("id")%>">ɾ��</a></td>
</tr>
<%rs.movenext:wend:rs.close%>
</table>
<%if act="showAdd" or act="showEdit" then%>
<form id="form1" name="form1" method="post" action="?act=addEdit&id=<%=id%>">
  ����
  <input type="text" name="uname"  value="<%=uname%>">
  <input type="submit" name="button" id="button" value="<%=btnTitle%>" > 
</form>
<%end if%>
