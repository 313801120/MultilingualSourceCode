<%
'ʹ��ASP���������� ����������ĸ
dim zm,s1,s2,s3,action,nIndex,sData,i,s
zm=request("zm")
s1=request("s1")
s2=request("s2")
s3=request("s3")
action=request("action")
nIndex=request("index")
if zm="" then zm="ABCDEFGHIJKLMNOPQRSTU" 
response.write("�˵���<a href='?'>����</a><br>")
if action="1" then
	call showSelectHtml(zm,2)
elseif instr("|2|3|4|","|"&action&"|")>0 then
	nIndex=cint(nIndex)
	if nIndex=1 then
		sData=s2&s1&s3
	elseif nIndex=2 then
		sData=s1&s2&s3
	else
		sData=s1&s3&s2
	end if
	if action="4" then
		s=mid(sData,11,1)
		response.Write("�������м�ס����ĸ�ǲ��� <b><font color=red>"& s &"</font></b>")
	else
		call showSelectHtml(sData,cint(action)+1)
	end if
else
	response.Write("��1�����������סһ����ĸ��<a href='?action=1'>���������һ��</a><div style='letter-spacing:10px;font-size:16px'>" & zm & "</div>")
end if
function showSelectHtml(byval zm,byval action)
	dim i,s,s1,s2,s3,sData
	for i=1 to len(zm)
		s=mid(zm,i,1)
		if i mod 3=1 then
			s1=s1 & s
		elseif i mod 3=2 then
			s2=s2 & s
		else
			s3=s3 & s
		end if
	next
	sData="&s1="&s1&"&s2="&s2&"&s3="&s3
	response.Write("��"& action &"����ѡ���������Ǹ���ĸ����һ��<hr>")
	response.Write("��һ�飺" & s1 & " <a href='?action="& action &"&index=1"&sData&"'>������</a><hr>")
	response.Write("�ڶ��飺" & s2 & " <a href='?action="& action &"&index=2"&sData&"'>������</a><hr>")
	response.Write("�����飺" & s3 & " <a href='?action="& action &"&index=3"&sData&"'>������</a><hr>")
end function
%>

















