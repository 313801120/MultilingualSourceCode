<% 
'ʹ��ASP���������� ʯͷ��������Ϸ
dim n,computerAction,selfAction,msg,sResult
selfAction=request("action")
if selfAction<>"" then
	randomize
	n=cint(int(rnd()*3))
	if n=1 then
		computerAction="ʯͷ"
	elseif n=2 then
		computerAction="����"
	else
		computerAction="��"
	end if
	if(selfAction="ʯͷ" and computerAction="����") or (selfAction="����" and computerAction="��") or (selfAction="��" and computerAction="ʯͷ") then
		session("nSelf")=session("nSelf")+1
		session("nComputer")=session("nComputer")-1
		sResult="<font color=green>��Ӯ��</font>"
	elseif(selfAction="ʯͷ" and computerAction="��") or (selfAction="����" and computerAction="ʯͷ") or (selfAction="��" and computerAction="����") then
		session("nSelf")=session("nSelf")-1
		session("nComputer")=session("nComputer")+1
		sResult="<font color=red>������</font>"
	else
		sResult="<font color=gray>ƽ��</font>"
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
<div id="computer">����<br><%=session("nComputer")%>��</div>
<div id="vs"><%=msg%></div>
<div id="self">���<br><%=session("nSelf")%>��</div>
<div style="clear:both"></div>
<div id="action"><a href="?action=ʯͷ">ʯͷ</a><a href="?action=����">����</a><a href="?action=��">��</a><a href="?">����</a></div>
<div id="record"><%=session("recordList")%></div>








