<script runat="server" language="c#">
//使用.NET C#语言来开发 石头剪刀布游戏
int n=0;string computerAction="布";string selfAction="";string msg="";string sResult=""; 
protected void Page_Load(object sender, EventArgs e){
	selfAction=Request["action"]+"";
	if(selfAction!=""){
		n=new Random().Next(1,4);
		if(n==1){
			computerAction="石头";
		}else if(n==2){
			computerAction="剪刀";
		}
		if( (selfAction=="石头"&&computerAction=="剪刀")||(selfAction=="剪刀"&&computerAction=="布")||(selfAction=="布"&&computerAction=="石头") ){
			Session["nSelf"]=Convert.ToInt32(Session["nSelf"])+1;
			Session["nComputer"]=Convert.ToInt32(Session["nComputer"])-1;
			sResult="<font color=green>你赢了</font>";
		}else if( (selfAction=="石头"&&computerAction=="布")||(selfAction=="剪刀"&&computerAction=="石头")||(selfAction=="布"&&computerAction=="剪刀") ){
			Session["nSelf"]=Convert.ToInt32(Session["nSelf"])-1;
			Session["nComputer"]=Convert.ToInt32(Session["nComputer"])+1;
			sResult="<font color=red>你输了</font>";
		}else{
			sResult="<font color=gray>平局</font>";
		}
		msg=computerAction+"VS"+selfAction+"<br>"+sResult;
		Session["recordList"]=Session["recordList"]+computerAction+"VS"+selfAction+"="+sResult+"("+Session["nSelf"]+")<br>";
	}else{
		Session["nComputer"]=88;Session["nSelf"]=88;Session["recordList"]="";
		msg="VS";
	} 
}</script> 
<style>.computer{float:left;}
.vs{float:left;width:140px; font-weight:bold;text-align:center;}
.self{float:left;}
.action a{line-height:30px;padding:8px;}</style>
<div class="computer">电脑<br><%=Session["nComputer"]%>币</div>
<div class="vs"><%=msg%></div>
<div class="self">玩家<br><%=Session["nSelf"]%>币</div>
<div style="clear:both"></div>
<div class="action"><a href="?action=石头">石头</a><a href="?action=剪刀">剪刀</a><a href="?action=布">布</a><a href="?">重置</a></div>
<div class="Record"><%=Session["recordList"]%></div>




