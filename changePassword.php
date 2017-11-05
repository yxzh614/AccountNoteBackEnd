<?php
//http://localhost/accountNoteBackEnd/changePassword
require_once('config.php');
class res {
    var $state = 0;
    var $error = 0;
}
$answer = new res();
if(isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    
    //application/json 的请求头不会在$_POST返回值，要用全局原始数据
    $postData = json_decode($GLOBALS['HTTP_RAW_POST_DATA']);
    $sqlCheck = "select password from user where username = '".$postData->username."'";
    if($resCheck = mysqli_query($db, $sqlCheck)) {
        if(mysqli_fetch_assoc($resCheck)["password"] !== $postData->old) {
        $answer->state = false;
        $answer->error = '旧密码错误！';
        } else {
            $sql ="update user set password = '".$postData->new."' where username='".$postData->username."'";
            if($res = mysqli_query($db, $sql)) {
                $answer->state = true;
                $answer->error = '';
            } else {
                $answer->state = false;
                $answer->error = $sql;
            }
        }
    }
}
if(get_magic_quotes_gpc()) {//去掉自动加的反斜杠
    echo stripslashes(json_encode($answer));
} else {
    echo json_encode($answer);
}
?>