<?php
//http://localhost/accountNote/getNextDayBillList
require_once('config.php');
$answer = array();
if(isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    $postData = json_decode($GLOBALS['HTTP_RAW_POST_DATA']);
    $sql = "SELECT * FROM `shouzhilist` WHERE year = ".$postData->year." AND month = ".$postData->month." AND username = '".$postData->username."' ORDER BY day DESC";
    if($res = mysqli_query($db, $sql)) {
    while($rows = mysqli_fetch_assoc($res)) {
        $answer[] = $rows;
    }
    } else {
        echo $sql;
    }
    if(get_magic_quotes_gpc()) {//去掉自动加的反斜杠
        echo stripslashes(json_encode($answer));
    } else {
        echo json_encode($answer);
    }
}