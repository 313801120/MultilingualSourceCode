<?PHP
//ʹ��PHP���������� ����������ĸ
header("Content-Type: text/html; charset=gb2312");
$zm=@$_REQUEST['zm'];
$action=@$_REQUEST['action'];
$nIndex=@$_REQUEST['index'];
$s1=@$_REQUEST['s1'];
$s2=@$_REQUEST['s2'];
$s3=@$_REQUEST['s3'];
if($zm=='')$zm='ABCDEFGHIJKLMNOPQRSTU';
echo('�˵���<a href=\'?\'>����</a><br>');
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
        echo('�������м�ס����ĸ�ǲ��� <b><font color=red>'. $s .'</font></b>');
    }else{
        showSelectHtml($sData,intval($action)+1);
    }
}else{ 
    echo('��1�����������סһ����ĸ��<a href=\'?action=1\'>���������һ��</a><div style=\'letter-spacing:10px;font-size:16px\'>' . $zm . '</div>');
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
    echo('��'. $action .'����ѡ���������Ǹ���ĸ����һ��<hr>');
    echo('��һ�飺' . $s1 . ' <a href=\'?action='. $action .'&index=1'.$sData.'\'>������</a><hr>');
    echo('�ڶ��飺' . $s2 . ' <a href=\'?action='. $action .'&index=2'.$sData.'\'>������</a><hr>');
    echo('�����飺' . $s3 . ' <a href=\'?action='. $action .'&index=3'.$sData.'\'>������</a><hr>');
}
?>
























 