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
//ʹ��.NET C#���������� ���ݿ���ɾ�Ĳ�
protected OleDbConnection conn=new OleDbConnection();
protected OleDbCommand comm=new OleDbCommand(); 
public string connStr ="";string id="";string uname="";string btnTitle="";string act=""; string sql=""; 
protected void Page_Load(object sender, EventArgs e){ 
    connStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+Server.MapPath("testDB.mdb");            //����access���ݿ� 
	//�������򴴽����ݿ�
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
	btnTitle="���";
	if(id!="" && id!=null)btnTitle="�޸�";  
	if(act=="addEdit"){
		if(id==""){
			sql="INSERT INTO testTable (uname) VALUES ('"+ uname +"')";
		}else{
			sql="UPDATE testTable set uname='"+ uname +"' where id=" + id;
		} 
		Bin_DataTable(sql);
		Response.Write(btnTitle + "�ɹ�<hr>");
	}else if(act=="del"){ 
		Bin_DataTable("delete * from testTable where id=" + id);
		Response.Write("ɾ��id("+id+")�ɹ�<hr>");
	}else if(act=="showEdit"){ 
		DataTable dbs=Bin_DataTable("select * from testTable where id="+id); 
		if(dbs.Rows.Count>0){
			uname=dbs.Rows[0]["uname"].ToString();
		}
	} 
	displayDialog();
    Response.End();
}  
 
//�������ݿ�
protected void openConnection(){
    if(conn.State==ConnectionState.Closed){
        try{ 
            conn.ConnectionString=connStr; 
            comm.Connection=conn;
            conn.Open();
        }catch(Exception Error){
            Response.Write("���ӳ���");
            Response.End(); 
        }
    }
}
//�ر�����
protected void closeConnection(){
    if(conn.State==ConnectionState.Open)
        conn.Close();
        conn.Dispose();
        comm.Dispose();
} 
//������
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

	Response.Write("<a href='?act=showAdd'>���һ���µ�</a><table width='100%' border='1' cellspacing='0' cellpadding='0'><tr><td>ID</td><td>����</td><td>����</td></tr>");
    openConnection();
    DataTable dbs=Bin_DataTable("SELECT * FROM testTable"); 
	string sId="";
    for(int i=0; i < dbs.Rows.Count; i++){
		sId=dbs.Rows[i]["id"].ToString();
     	Response.Write("<tr><td>"+sId+"</td><td>"+dbs.Rows[i]["uname"].ToString()+"</td>");
   		Response.Write("<td><a href='?act=showEdit&id="+sId+"'>�޸�</a> | <a href='?act=del&id="+sId+"'>ɾ��</a></td> </tr> "); 
     }
     Response.Write("</table>");
	 if(act=="showAdd" || act=="showEdit"){
     	Response.Write("<form id='form1' name='form1' method='post' action='?act=addEdit&id="+ id +"'>����<input type='text' name='uname'  value='"+uname+"'>");
     	Response.Write("<input type='submit' name='button' id='button' value='"+btnTitle+"'></form> ");
     }
 
 	closeConnection();
}
</script> 





