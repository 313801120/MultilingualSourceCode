<%
'使用ASP语言来开发 猜你心中字母
dim zm,s1,s2,s3,action,nIndex,sData,i,s
zm=request("zm")
s1=request("s1")
s2=request("s2")
s3=request("s3")
action=request("action")
nIndex=request("index")
if zm="" then zm="ABCDEFGHIJKLMNOPQRSTU" 
response.write("菜单：<a href='?'>重置</a><br>")
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
		response.Write("猜你心中记住的字母是不是 <b><font color=red>"& s &"</font></b>")
	else
		call showSelectHtml(sData,cint(action)+1)
	end if
else
	response.Write("第1步：请心里记住一个字母：<a href='?action=1'>点击进入下一步</a><div style='letter-spacing:10px;font-size:16px'>" & zm & "</div>")
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
	response.Write("第"& action &"步：选择你心里那个字母在哪一组<hr>")
	response.Write("第一组：" & s1 & " <a href='?action="& action &"&index=1"&sData&"'>在这里</a><hr>")
	response.Write("第二组：" & s2 & " <a href='?action="& action &"&index=2"&sData&"'>在这里</a><hr>")
	response.Write("第三组：" & s3 & " <a href='?action="& action &"&index=3"&sData&"'>在这里</a><hr>")
end function
%>

















