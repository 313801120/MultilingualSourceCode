<% 
'使用ASP语言来开发 石头剪刀布游戏
dim n,computerAction,selfAction,msg,sResult
selfAction=request("action")
if selfAction<>"" then
	randomize
	n=cint(int(rnd()*3))
	if n=1 then
		computerAction="石头"
	elseif n=2 then
		computerAction="剪刀"
	else
		computerAction="布"
	end if
	if(selfAction="石头" and computerAction="剪刀") or (selfAction="剪刀" and computerAction="布") or (selfAction="布" and computerAction="石头") then
		session("nSelf")=session("nSelf")+1
		session("nComputer")=session("nComputer")-1
		sResult="<font color=green>你赢了</font>"
	elseif(selfAction="石头" and computerAction="布") or (selfAction="剪刀" and computerAction="石头") or (selfAction="布" and computerAction="剪刀") then
		session("nSelf")=session("nSelf")-1
		session("nComputer")=session("nComputer")+1
		sResult="<font color=red>你输了</font>"
	else
		sResult="<font color=gray>平局</font>"
	end if
	msg=computerAction&"VS"&selfAction&"<br>"&sResult
	session("recordList")=session("recordList")&computerAction&"VS"&selfAction&"="&sResult&"("&session("nSelf") &")<br>"

else
	session("nComputer")=88:session("nSelf")=88:session("recordList")=""
	msg="VS"
end if
%>
<style>#computer{float:left;}
#vs{float:left;width:140px; font-weight:bold;text-align:center;}
#self{float:left;}
#action a{line-height:30px;padding:8px;}</style>
<div id="computer">电脑<br><%=session("nComputer")%>币</div>
<div id="vs"><%=msg%></div>
<div id="self">玩家<br><%=session("nSelf")%>币</div>
<div style="clear:both"></div>
<div id="action"><a href="?action=石头">石头</a><a href="?action=剪刀">剪刀</a><a href="?action=布">布</a><a href="?">重置</a></div>
<div id="record"><%=session("recordList")%></div>








