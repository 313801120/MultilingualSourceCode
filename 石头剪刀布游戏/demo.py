#使用python语言来开发 石头剪刀布游戏
print('Content-type: text/html\n')
import cgi
import random 
def handleSJB(n):
	if n==1:
		return '石头'
	elif  n==2:
		return '剪刀'
	elif  n==3:
		return '布'
	else:
		return ''
form=cgi.FieldStorage()
selfAction=handleSJB(int(form.getvalue('action','0')))
nComputer=form.getvalue('nComputer',88)
nSelf=form.getvalue('nSelf',88)
n=random.randint(1,3);
computerAction=handleSJB(n)
if( (selfAction=="石头" and computerAction=="剪刀") or (selfAction=="剪刀" and computerAction=="布") or (selfAction=="布" and computerAction=="石头") ):
	nSelf=int(nSelf)+1;nComputer=int(nComputer)-1
	sResult="<font color=green>你赢了</font>"
elif( (selfAction=="石头" and computerAction=="布") or (selfAction=="剪刀" and computerAction=="石头") or (selfAction=="布" and computerAction=="剪刀") ):
	nSelf=int(nSelf)-1;nComputer=int(nComputer)+1
	sResult="<font color=red>你输了</font>"
else:
	sResult="<font color=gray>平局</font>"
msg=computerAction + " VS " + selfAction + "<br>"+sResult
recordList=computerAction + " VS " + selfAction + "=" +sResult + "("+str(nSelf)+")<br>"
if selfAction=="":
	msg="VS";recordList=''
print('<style>#computer{float:left;}')
print('#vs{float:left;width:140px; font-weight:bold;text-align:center;}')
print('#self{float:left;}')
print('#action a{line-height:30px;padding:8px;}</style>')
print('<div id="computer">电脑<br>'+str(nComputer)+'币</div>')
print('<div id="vs">'+msg+'</div>')
print('<div id="self">玩家<br>'+str(nSelf)+'币</div>')
print('<div style="clear:both"></div>')
print('<div id="action"><a href="?action=1&nComputer='+str(nComputer)+'&nSelf='+str(nSelf)+'">石头</a>')
print('<a href="?action=2&nComputer='+str(nComputer)+'&nSelf='+str(nSelf)+'">剪刀</a>')
print('<a href="?action=3&nComputer='+str(nComputer)+'&nSelf='+str(nSelf)+'">布</a>')
print('<a href="?">重置</a></div><div id="record">'+recordList+'</div>') 