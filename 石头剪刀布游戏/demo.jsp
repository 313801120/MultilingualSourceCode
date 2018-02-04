<%@ page language="java" pageEncoding="utf-8"%><%
//使用JSP语言来开发 石头剪刀布游戏
int n=0;String computerAction="布";String selfAction;String msg;String sResult;
selfAction=String.valueOf(request.getParameter("action"));  
if( selfAction.equals("null")==false ){
	n=(int)(Math.random()*3)+1;
	if(n==1){
		computerAction="石头";
	}else if(n==2){
		computerAction="剪刀";
	}
	if( (selfAction.equals("石头")&&computerAction.equals("剪刀"))||(selfAction.equals("剪刀")&&computerAction.equals("布"))||(selfAction.equals("布")&&computerAction.equals("石头")) ) {
		session.setAttribute("nSelf",(Integer)session.getAttribute("nSelf")+1);
		session.setAttribute("nComputer",(Integer)session.getAttribute("nComputer")-1);
		sResult="<font color=green>你赢了</font>";
	}else if( (selfAction.equals("石头")&&computerAction.equals("布"))||(selfAction.equals("剪刀")&&computerAction.equals("石头"))||(selfAction.equals("布")&&computerAction.equals("剪刀")) ) {
		session.setAttribute("nSelf",(Integer)session.getAttribute("nSelf")-1);
		session.setAttribute("nComputer",(Integer)session.getAttribute("nComputer")+1);
		sResult="<font color=red>你输了</font>";
	}else{
		sResult="<font color=gray>平局</font>";
	}
    msg=computerAction + " VS " + selfAction + "<br>"+sResult; 
	session.setAttribute("recordList",session.getAttribute("recordList") + computerAction + " VS " + selfAction + "="+sResult+"("+session.getAttribute("nSelf")+")<br>");
}else{
	session.setAttribute("nComputer",88);
	session.setAttribute("nSelf",88);
	session.setAttribute("recordList","");   
    msg="VS";
}%><style>.computer{float:left;}
.vs{float:left;width:140px; font-weight:bold;text-align:center;}
.self{float:left;}
.action a{line-height:30px;padding:8px;}</style>
<div class="computer">电脑<br><%=session.getAttribute("nComputer")%>币</div>
<div class="vs"><%=msg%></div>
<div class="self">玩家<br><%=session.getAttribute("nSelf")%>币</div>
<div style="clear:both"></div>
<div class="action"><a href="?action=石头">石头</a><a href="?action=剪刀">剪刀</a><a href="?action=布">布</a><a href="?">重置</a></div>
<div class="Record"><%=session.getAttribute("recordList")%></div>