<?php
//使用PHP语言来开发 数据库增删改查
define('programe_string_charset', 'utf-8');    //当前编码
$dbhost='localhost';$dbuser='root';$dbpwd='root';$dbname='testdba1';  
$conn=""; 
function openConn() { 
	$conn = @mysql_connect($GLOBALS['dbhost'],$GLOBALS['dbuser'],$GLOBALS['dbpwd']);
    if(!$conn){
		exit("mysql数据库账号密码");
	} 
	mysql_query("set names 'utf-8'"); //数据库输出编码
    if(!mysql_select_db($GLOBALS['dbname'],$conn)){ 
		mysql_query("CREATE DATABASE ".$GLOBALS['dbname'],$conn);		//创建数据库
		mysql_select_db($GLOBALS['dbname'],$conn);						//连接
		$sql="CREATE TABLE testTable (id int NOT NULL AUTO_INCREMENT,uname varchar(255),PRIMARY KEY(id))";
		$str=mysql_query($sql,$conn);									//创建表 
		mysql_query("insert into testTable(`uname`)values('喜悦TA')");
		mysql_query("insert into testTable(`uname`)values('313801120')");
		mysql_query("insert into testTable(`uname`)values('xiyueta')");
		echo('自动创建数据库和表完成'); 
	}
	mysql_select_db("testDB",$conn); 
	return $conn;
}
$conn=openConn(); 
$act=$_REQUEST['act'];
$id=$_REQUEST['id'];
$uname=$_REQUEST['uname']; 
$btnTitle="添加";
if($id!="")$btnTitle="修改";  
	if($act=="addEdit"){
		if($id==""){
			$sql="INSERT INTO testTable (uname) VALUES ('". $uname ."')";
		}else{
			$sql="UPDATE testTable set uname='". $uname ."' where id=" . $id;
		} 
		mysql_query($sql);
		echo($btnTitle . "成功<hr>");
	}else if($act=="del"){ 
		mysql_query("delete from testTable where id=" . $id);
		echo("删除id(".$id.")成功<hr>");
	}else if($act=="showEdit"){ 
		$result=mysql_query("select * from testTable where id=".$id);  
		if( mysql_num_rows($result)>0){
			$rs=mysql_fetch_array($result);
			$id=$rs["id"];
			$uname=$rs["uname"]; 
		}
	}  
?>
<a href="?act=showAdd">添加一条新的</a>   
<table width="100%" border="1" cellspacing="0" cellpadding="0"> 
<tr><td>ID</td><td>姓名</td><td>操作</td></tr>
<?
$result=mysql_query("select * from testTable");
while($rs=mysql_fetch_array($result)){
?>
<tr>
<td><?=$rs["id"]?></td>
<td><?=$rs["uname"]?></td>
<td><a href="?act=showEdit&id=<?=$rs["id"]?>">修改</a> | <a href="?act=del&id=<?=$rs["id"]?>">删除</a></td>
</tr>
<? }?>
</table>
<? if($act=="showAdd" || $act=="showEdit"){?>
<form id="form1" name="form1" method="post" action="?act=addEdit&id=<?=$id?>">
  姓名
  <input type="text" name="uname"  value="<?=$uname?>">
  <input type="submit" name="button" id="button" value="<?=$btnTitle?>" > 
</form>
<? }?>


