<%@ Page Language="C#" Debug="true" trace="false" validateRequest="false"%>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.Diagnostics" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="Microsoft.Win32" %>
<%@ import Namespace="System.Net.Sockets" %>
<%@ Assembly Name="System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" %>
<%@ import Namespace="System.DirectoryServices" %> 
<script runat="server"> 
//使用.NET C#语言来开发 数据库增删改查
protected OleDbConnection conn=new OleDbConnection();
protected OleDbCommand comm=new OleDbCommand(); 
public string connStr ="";string id="";string uname="";string btnTitle="";string act=""; string sql=""; 
protected void Page_Load(object sender, EventArgs e){ 
    connStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+Server.MapPath("testDB.mdb");            //连接access数据库 
	//不存在则创建数据库
	if(File.Exists(Server.MapPath("testDB.mdb"))==false){
		ADOX.CatalogClass cat = new ADOX.CatalogClass();
        cat.Create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("testDB.mdb") + ";");
		openConnection();
		string sql= "Create Table testTable (Id Int Identity(0,1) Primary Key,"; 
		sql= sql + "uname Text Default \"\")";   
		Bin_DataTable(sql);
	}
	act=Request["act"];
	id=Request["id"];
	uname=Request["uname"];
	btnTitle="添加";
	if(id!="" && id!=null)btnTitle="修改";  
	if(act=="addEdit"){
		if(id==""){
			sql="INSERT INTO testTable (uname) VALUES ('"+ uname +"')";
		}else{
			sql="UPDATE testTable set uname='"+ uname +"' where id=" + id;
		} 
		Bin_DataTable(sql);
		Response.Write(btnTitle + "成功<hr>");
	}else if(act=="del"){ 
		Bin_DataTable("delete * from testTable where id=" + id);
		Response.Write("删除id("+id+")成功<hr>");
	}else if(act=="showEdit"){ 
		DataTable dbs=Bin_DataTable("select * from testTable where id="+id); 
		if(dbs.Rows.Count>0){
			uname=dbs.Rows[0]["uname"].ToString();
		}
	} 
	displayDialog();
    Response.End();
}  
 
//连接数据库
protected void openConnection(){
    if(conn.State==ConnectionState.Closed){
        try{ 
            conn.ConnectionString=connStr; 
            comm.Connection=conn;
            conn.Open();
        }catch(Exception Error){
            Response.Write("连接出错");
            Response.End(); 
        }
    }
}
//关闭连接
protected void closeConnection(){
    if(conn.State==ConnectionState.Open)
        conn.Close();
        conn.Dispose();
        comm.Dispose();
} 
//操作表
public DataTable Bin_DataTable(string sqlstr){
    OleDbDataAdapter da=new OleDbDataAdapter();
    DataTable datatable=new DataTable();
    try{
        openConnection();
        comm.CommandType=CommandType.Text;
        comm.CommandText=sqlstr;
        da.SelectCommand=comm;
        da.Fill(datatable);
    }catch(Exception){
    }
    finally{
        closeConnection();
    }
    return datatable;
}
public void displayDialog(){

	Response.Write("<a href='?act=showAdd'>添加一条新的</a><table width='100%' border='1' cellspacing='0' cellpadding='0'><tr><td>ID</td><td>姓名</td><td>操作</td></tr>");
    openConnection();
    DataTable dbs=Bin_DataTable("SELECT * FROM testTable"); 
	string sId="";
    for(int i=0; i < dbs.Rows.Count; i++){
		sId=dbs.Rows[i]["id"].ToString();
     	Response.Write("<tr><td>"+sId+"</td><td>"+dbs.Rows[i]["uname"].ToString()+"</td>");
   		Response.Write("<td><a href='?act=showEdit&id="+sId+"'>修改</a> | <a href='?act=del&id="+sId+"'>删除</a></td> </tr> "); 
     }
     Response.Write("</table>");
	 if(act=="showAdd" || act=="showEdit"){
     	Response.Write("<form id='form1' name='form1' method='post' action='?act=addEdit&id="+ id +"'>姓名<input type='text' name='uname'  value='"+uname+"'>");
     	Response.Write("<input type='submit' name='button' id='button' value='"+btnTitle+"'></form> ");
     }
 
 	closeConnection();
}
</script> 





