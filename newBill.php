<?php
//http://localhost/accountNote/newBill
require_once('config.php');
class res {
    var $state = 0;
    var $error = 0;
}
$answer = new res();
if(isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    //application/json 的请求头不会在$_POST返回值，要用全局原始数据
    $postData = json_decode($GLOBALS['HTTP_RAW_POST_DATA']);
    $sql = "INSERT INTO `shouzhilist` (`ID`,
     `username`,
      `title`,
       `type`,
        `year`,
         `month`,
          `day`,
           `money`)
            VALUES (NULL, '".$postData->username."',
             '".$postData->title."',
             '".$postData->type."',
             ".$postData->year.",
              ".$postData->month.",
               ".$postData->day.",
                ".$postData->money.")";
    if($res = mysqli_query($db, $sql)) {
        $answer->state = true;
        $answer->error = '';
    } else {
        $answer->state = false;
        $answer->error = $sql;
    }
}
if(get_magic_quotes_gpc()) {//去掉自动加的反斜杠
    echo stripslashes(json_encode($answer));
} else {
    echo json_encode($answer);
}
?>