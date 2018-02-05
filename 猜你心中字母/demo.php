<?PHP
//使用PHP语言来开发 猜你心中字母
header("Content-Type: text/html; charset=gb2312");
$zm=@$_REQUEST['zm'];
$action=@$_REQUEST['action'];
$nIndex=@$_REQUEST['index'];
$s1=@$_REQUEST['s1'];
$s2=@$_REQUEST['s2'];
$s3=@$_REQUEST['s3'];
if($zm=='')$zm='ABCDEFGHIJKLMNOPQRSTU';
echo('菜单：<a href=\'?\'>重置</a><br>');
if( $action=='1' ){
    showSelectHtml($zm,2);
}else if( strstr('|2|3|4|','|'.$action.'|')!='' ){
    $nIndex=intval($nIndex);
    if( $nIndex==1 ){
        $sData=$s2.$s1.$s3;
    }else if( $nIndex==2 ){
        $sData=$s1.$s2.$s3;
    }else if( $nIndex==3 ){
        $sData=$s1.$s3.$s2;
    }
    if( $action=='4' ){ 
		$s= mb_substr($sData,10,1);
        echo('猜你心中记住的字母是不是 <b><font color=red>'. $s .'</font></b>');
    }else{
        showSelectHtml($sData,intval($action)+1);
    }
}else{ 
    echo('第1步：请心里记住一个字母：<a href=\'?action=1\'>点击进入下一步</a><div style=\'letter-spacing:10px;font-size:16px\'>' . $zm . '</div>');
}
function showSelectHtml( $zm, $action){ 
    for( $i=1 ; $i<= mb_strlen($zm); $i++){
        $s=mb_substr($zm,$i-1,1);
        if( $i % 3==1 ){		
            $s1=$s1 . $s;
        }else if( $i % 3==2 ){
            $s2=$s2 . $s;
        }else{
            $s3=$s3 . $s;
        }
    }
    $sData='&s1='.$s1.'&s2='.$s2.'&s3='.$s3;
    echo('第'. $action .'步：选择你心里那个字母在哪一组<hr>');
    echo('第一组：' . $s1 . ' <a href=\'?action='. $action .'&index=1'.$sData.'\'>在这里</a><hr>');
    echo('第二组：' . $s2 . ' <a href=\'?action='. $action .'&index=2'.$sData.'\'>在这里</a><hr>');
    echo('第三组：' . $s3 . ' <a href=\'?action='. $action .'&index=3'.$sData.'\'>在这里</a><hr>');
}
?>
























 