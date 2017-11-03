<?php
//http://localhost/accountNote/newBudget
require_once('config.php');
class res {
    var $state = 0;
    var $error = 0;
}
$answer = new res();
if(isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    
    //application/json 的请求头不会在$_POST返回值，要用全局原始数据
    $postData = json_decode($GLOBALS['HTTP_RAW_POST_DATA']);
    $sqlCheck = "select count(type) from yusuanlist where username='".$postData->username."' and year=".$postData->year." and month=".$postData->month." and type = '".$postData->type."'";
    if($resCheck = mysqli_query($db, $sqlCheck)) {
        if(mysqli_fetch_assoc($resCheck)["count(type)"] == 1) {
        $answer->state = false;
        $answer->error = '预算类别已存在！';
        } else {
            $sql = "INSERT INTO `yusuanlist` (`ID`,`username`,`type`,`year`,`month`,`money`) VALUES (NULL, '".$postData->username."','".$postData->type."',".$postData->year.",".$postData->month.",".$postData->money.")";
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