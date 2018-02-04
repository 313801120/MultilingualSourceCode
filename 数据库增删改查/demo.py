#使用python语言来开发 数据库增删改查
print('Content-type: text/html\n') 
import pymysql
import cgi 
db = pymysql.connect("localhost", "root", "root", "testdba1")   
cursor = db.cursor()  

form=cgi.FieldStorage()
act=form.getvalue('act',"")
id=form.getvalue('id',"")
uname=form.getvalue('uname',"")
btnTitle="添加"
if( id!="" ):
	btnTitle="修改"

#删除
if( act=="del" ):
	try:
		cursor.execute('delete from testTable where id=' + id)   
		db.commit()  
		print("删除id(%s)成功<hr>" % (id)) 
	except:   
		print("Error: delete error")  
#添加
elif( act=="addEdit" and id=="" ): 
	try:   
	   cursor.execute( ("INSERT INTO testTable (uname) VALUES ('" + uname + "')").encode('utf8')  )   
	   db.commit()  
	except:   
	   print("Error: add data")  
#修改
elif( act=="addEdit" and id!="" ): 
	try:   
	   cursor.execute("UPDATE testTable set uname='" + uname + "' where id=" + id)   
	   db.commit()  
	except:   
	   print("Error: edit data")  
#显示
elif( act=="showEdit" ):
	try:
		cursor.execute('SELECT * FROM testtable where id=' + id)   
		results = cursor.fetchall()  
		for row in results:  
		    uname = row[1]  
		    #print("uname=%s" % (uname)) 
	except:   
		print("Error: select error")  

print("<a href=?act=showAdd>添加一条新的</a>");
print("<table width=100% border=1 cellspacing=0 cellpadding=0><tr><td>ID</td><td>姓名</td><td>操作</td></tr>");
try:
	cursor.execute('SELECT * FROM testTable')   
	results = cursor.fetchall()  
	for row in results:  
	    sId = row[0]  
	    name = row[1]
	    print("<tr><td>%s</td><td>%s</td>" % (sId,name)) 
	    print("<td><a href=?act=showEdit&id=%s>修改</a> | <a href=?act=del&id=%s>删除</a></td></tr>" % (sId,sId)) 
except:   
	print("Error: unable to fecth data")  

if( (act=="showAdd" or act=="showEdit")   ):
	print("<br><form method='post' action='?act=addEdit&id=%s'>姓名" % (id));
	print("<input type='text' id='uname' name='uname' value='%s'><input type='submit' value='%s' ></form>" % (uname,btnTitle));

 

db.close()  