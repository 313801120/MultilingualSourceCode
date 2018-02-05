#使用python语言来开发 计算器 视频演示教程
print('Content-type: text/html\n')

import cgi
form=cgi.FieldStorage()
act=form.getvalue('act','')
c=form.getvalue('c','')
if act=="jisuan":
	print("%s=%s" % (c,eval(c)))  #第一种方法
	print("<hr>"+c+"=<script>document.write(eval('"+c+"'))</script>")#第二种方法
else:
	c="1+1+2+3"



print('<form method="post" action="?act=jisuan" >')
print('公式<input name="c" type="text" value="'+c+'" />')
print('<input type="submit" value="计算" /></form>')