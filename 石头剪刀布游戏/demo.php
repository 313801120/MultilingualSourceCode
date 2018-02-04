<?PHP
//使用PHP语言来开发 石头剪刀布游戏
header("Content-Type: text/html; charset=gb2312");
session_start(); // 启动Session 
$computerAction='布';$selfAction;$msg;$sResult;
$selfAction=@$_REQUEST['action']; 
if($selfAction<>''){ 
	$n=mt_rand(1,3);
	if($n==1){
		$computerAction='石头';
	}else if($n==2){
		$computerAction='剪刀';
	}
	if( ($selfAction=='石头'&&$computerAction=='剪刀')||($selfAction=='剪刀'&&$computerAction=='布')||($selfAction=='布'&&$computerAction=='石头') ){
		$_SESSION['nSelf']=@$_SESSION['nSelf']+1;
		$_SESSION['nComputer']=@$_SESSION['nComputer']-1;
		$sResult='<font color=green>你赢了</font>';
	}else if( ($selfAction=='石头'&&$computerAction=='布')||($selfAction=='剪刀'&&$computerAction=='石头')||($selfAction=='布'&&$computerAction=='剪刀') ){
		$_SESSION['nSelf']=@$_SESSION['nSelf']-1;
		$_SESSION['nComputer']=@$_SESSION['nComputer']+1;
		$sResult='<font color=red>你输了</font>';
	}else{
		$sResult='<font color=gray>平局</font>';		
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
<div class="computer">电脑<br><?=@$_SESSION["nComputer"]?>币</div>
<div class="vs"><?=$msg?></div>
<div class="self">玩家<br><?=@$_SESSION["nSelf"]?>币</div>
<div style="clear:both"></div>
<div class="action"><a href="?action=石头">石头</a><a href="?action=剪刀">剪刀</a><a href="?action=布">布</a><a href="?">重置</a></div>
<div class="Record"><?=@$_SESSION["recordList"]?></div>









