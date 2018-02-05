<?PHP
//使用PHP语言来开发 计算器 视频演示教程
header('Content-type: text/html; charset=gb2312');
$c='1+1+2+3';
if(@$_REQUEST['act']=='jisuan'){
	$c=@$_REQUEST['c'];
	echo($c.'='.eval("return($c);"));//第一种方法
	echo('<hr>'.$c.'=<script>document.write(eval("'.$c.'"))</script>');//第二种方法
} 
?> 
<form method="post" action="?act=jisuan">
公式<input type="text" name="c" value="<?=$c?>" />
<input type="submit" value="计算" />
</form>