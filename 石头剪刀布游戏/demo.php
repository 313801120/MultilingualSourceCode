<?PHP
//ʹ��PHP���������� ʯͷ��������Ϸ
header("Content-Type: text/html; charset=gb2312");
session_start(); // ����Session 
$computerAction='��';$selfAction;$msg;$sResult;
$selfAction=@$_REQUEST['action']; 
if($selfAction<>''){ 
	$n=mt_rand(1,3);
	if($n==1){
		$computerAction='ʯͷ';
	}else if($n==2){
		$computerAction='����';
	}
	if( ($selfAction=='ʯͷ'&&$computerAction=='����')||($selfAction=='����'&&$computerAction=='��')||($selfAction=='��'&&$computerAction=='ʯͷ') ){
		$_SESSION['nSelf']=@$_SESSION['nSelf']+1;
		$_SESSION['nComputer']=@$_SESSION['nComputer']-1;
		$sResult='<font color=green>��Ӯ��</font>';
	}else if( ($selfAction=='ʯͷ'&&$computerAction=='��')||($selfAction=='����'&&$computerAction=='ʯͷ')||($selfAction=='��'&&$computerAction=='����') ){
		$_SESSION['nSelf']=@$_SESSION['nSelf']-1;
		$_SESSION['nComputer']=@$_SESSION['nComputer']+1;
		$sResult='<font color=red>������</font>';
	}else{
		$sResult='<font color=gray>ƽ��</font>';		
	}
	$msg=$computerAction.'VS'.$selfAction.'<br>'.$sResult;
	$_SESSION['recordList']=@$_SESSION['recordList'].$computerAction.'VS'.$selfAction.'='.$sResult.'('.$_SESSION['nSelf'].')<br>';

}else{
   $_SESSION['nComputer']=88;$_SESSION['nSelf']=88;$_SESSION['recordList']='';
   $msg='VS';
}
?><style>.computer{float:left;}
.vs{float:left;width:140px; font-weight:bold;text-align:center;}
.self{float:left;}
.action a{line-height:30px;padding:8px;}</style>
<div class="computer">����<br><?=@$_SESSION["nComputer"]?>��</div>
<div class="vs"><?=$msg?></div>
<div class="self">���<br><?=@$_SESSION["nSelf"]?>��</div>
<div style="clear:both"></div>
<div class="action"><a href="?action=ʯͷ">ʯͷ</a><a href="?action=����">����</a><a href="?action=��">��</a><a href="?">����</a></div>
<div class="Record"><?=@$_SESSION["recordList"]?></div>









