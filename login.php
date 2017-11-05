<?php
//http://localhost/accountNoteBackEnd/login
require_once('config.php');
class res {
    var $state = 0;
    var $error = 0;
}
$answer = new res();
if(isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    //application/json 的请求头不会在$_POST返回值，要用全局原始数据
    $postData = json_decode($GLOBALS['HTTP_RAW_POST_DATA']);
    $sqlLogin = "select username, password from user where username='".$postData -> username."'";
    $res = mysqli_query($db, $sqlLogin);
    if($rows=mysqli_fetch_assoc($res)) {
        if($postData -> password == $rows['password']) {
            $answer->state = true;
            $answer->error = '';
        } else {
            $answer->state = false;
            $answer->error = '密码错误！';
        }
    } else {
        $answer->state = false;
        $answer->error = '用户名不存在！';
    }
}
if(get_magic_quotes_gpc()) {//去掉自动加的反斜杠
    echo stripslashes(json_encode($answer));
} else {
    echo json_encode($answer);
}
?>