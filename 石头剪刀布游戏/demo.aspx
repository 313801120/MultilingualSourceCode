<script runat="server" language="c#">
//ʹ��.NET C#���������� ʯͷ��������Ϸ
int n=0;string computerAction="��";string selfAction="";string msg="";string sResult=""; 
protected void Page_Load(object sender, EventArgs e){
	selfAction=Request["action"]+"";
	if(selfAction!=""){
		n=new Random().Next(1,4);
		if(n==1){
			computerAction="ʯͷ";
		}else if(n==2){
			computerAction="����";
		}
		if( (selfAction=="ʯͷ"&&computerAction=="����")||(selfAction=="����"&&computerAction=="��")||(selfAction=="��"&&computerAction=="ʯͷ") ){
			Session["nSelf"]=Convert.ToInt32(Session["nSelf"])+1;
			Session["nComputer"]=Convert.ToInt32(Session["nComputer"])-1;
			sResult="<font color=green>��Ӯ��</font>";
		}else if( (selfAction=="ʯͷ"&&computerAction=="��")||(selfAction=="����"&&computerAction=="ʯͷ")||(selfAction=="��"&&computerAction=="����") ){
			Session["nSelf"]=Convert.ToInt32(Session["nSelf"])-1;
			Session["nComputer"]=Convert.ToInt32(Session["nComputer"])+1;
			sResult="<font color=red>������</font>";
		}else{
			sResult="<font color=gray>ƽ��</font>";
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
<div class="computer">����<br><%=Session["nComputer"]%>��</div>
<div class="vs"><%=msg%></div>
<div class="self">���<br><%=Session["nSelf"]%>��</div>
<div style="clear:both"></div>
<div class="action"><a href="?action=ʯͷ">ʯͷ</a><a href="?action=����">����</a><a href="?action=��">��</a><a href="?">����</a></div>
<div class="Record"><%=Session["recordList"]%></div>




