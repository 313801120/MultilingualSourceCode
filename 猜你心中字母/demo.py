#使用python语言来开发 猜你心中字母
print('Content-type: text/html\n')
import cgi
def showSelectHtml(zm,action):
	s1="";s2="";s3="";sData="";c="";
	for i in range(0,len(zm)):
		s=zm[i:i+1]
		if (i+1)%3==1:
			s1=s1 + s;
		elif (i+1)%3==2:
			s2=s2 + s;
		else:
			s3=s3 + s;
	sData="&s1="+s1+"&s2="+s2+"&s3="+s3;
	c='第'+ str(action) +'步：选择你心里那个字母在哪一组<hr>'; 
	c=c+"第一组：" + s1 + " <a href='?action="+ str(action) +"&index=1"+sData+"'>在这里</a><hr>";
	c+="第二组：" + s2 + " <a href='?action="+ str(action) +"&index=2"+sData+"'>在这里</a><hr>";
	c+="第三组：" + s3 + " <a href='?action="+ str(action) +"&index=3"+sData+"'>在这里</a><hr>";
	return c; 


form=cgi.FieldStorage()
zm=form.getvalue('zm','')
action=form.getvalue('action','')
nIndex=form.getvalue('index','')
s1=form.getvalue('s1','')
s2=form.getvalue('s2','')
s3=form.getvalue('s3','')
sData=""
if zm=="":
	zm="ABCDEFGHIJKLMNOPQRSTU"; 

print("菜单：<a href='?'>重置</a><br>");
if action=="1":
	print(showSelectHtml(zm,2));
elif action=="2" or action=="3" or action=="4":
	nIndex=int(nIndex);
	if nIndex==1:
		sData=s2+s1+s3;
	elif nIndex==2:
		sData=s1+s2+s3;
	elif nIndex==3:
		sData=s1+s3+s2;

	if action=="4":  
		s=sData[10:11];
		print("猜你心中记住的字母是不是 <b><font color=red>"+ s +"</font></b>");
	else: 
		print(showSelectHtml(sData,int(action)+1));

else:
	print("第1步：请心里记住一个字母：<a href='?action=1'>点击进入下一步</a><div style='letter-spacing:10px;font-size:16px'>" + zm + "</div>");
 





















