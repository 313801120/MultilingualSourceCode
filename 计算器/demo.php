<?PHP
//ʹ��PHP���������� ������ ��Ƶ��ʾ�̳�
header('Content-type: text/html; charset=gb2312');
$c='1+1+2+3';
if(@$_REQUEST['act']=='jisuan'){
	$c=@$_REQUEST['c'];
	echo($c.'='.eval("return($c);"));//��һ�ַ���
	echo('<hr>'.$c.'=<script>document.write(eval("'.$c.'"))</script>');//�ڶ��ַ���
} 
?> 
<form method="post" action="?act=jisuan">
��ʽ<input type="text" name="c" value="<?=$c?>" />
<input type="submit" value="����" />
</form>