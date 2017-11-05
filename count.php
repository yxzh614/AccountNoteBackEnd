<?php
//http://localhost/accountNoteBackEnd/count
require_once('config.php');
$monthTotalIn = 0;
$monthTotalCost = 0;
$monthTotalYusuan = 0;
$jieyu = 0;
$chaozhi = 0;
$daycost = 0;
$costPercent = array();
$answer = array();
if(isset($GLOBALS['HTTP_RAW_POST_DATA'])) {
    $postData = json_decode($GLOBALS['HTTP_RAW_POST_DATA']);
    $days = 0;
    $yearn = $postData->year;
    $monthn = $postData->month;
    if($postData->monthChange == 0) {
        $days = $postData->day;
    } else {
        if(($monthn -= $postData->monthChange) > 0) {
        $days = date("t",strtotime("$yearn-$monthn"));
        } else {
            while($monthn<0) {
                $yearn --;
                $monthn += 12;
            }
           $days = date("t",strtotime("$yearn-$monthn"));
        }
    }
    $sqlCheck = "select count(month) from monthlist where year = ".$yearn." AND month = ".$monthn." AND money > 0 AND username = '".$postData->username."'";
    if($resc = mysqli_query($db, $sqlCheck))
        if($rowsc = mysqli_fetch_assoc($resc)) {
            if($rowc['count(month)'] == 0) {
                $sqlNewMonth = "INSERT INTO `monthlist` (`ID`, `username`, `zhanbi`, `daycost`, `totalin`, `totalout`, `jieyu`, `chazhi`, `year`, `month`) VALUES (NULL, '".$postData->username."', '{}', '0', '0', '0', '0', '0', '".$postData->year."', '".$postData->month."')";
            }
        }
    $sqlGetTotalIn = "SELECT sum(money) FROM `shouzhilist` WHERE year = ".$yearn." AND month = ".$monthn." AND money > 0 AND username = '".$postData->username."'";
    if($res = mysqli_query($db, $sqlGetTotalIn)) {
    while($rows = mysqli_fetch_assoc($res)) {
        $monthTotalIn = $rows['sum(money)'];
    }
    } else {
        echo $sqlGetTotalIn;
    }
    
    $sqlGetTotalCost = "SELECT sum(money) FROM `shouzhilist` WHERE year = ".$yearn." AND month = ".$monthn." AND money < 0 AND username = '".$postData->username."'";
    if($res2 = mysqli_query($db, $sqlGetTotalCost)) {
    while($rows2 = mysqli_fetch_assoc($res2)) {
        $monthTotalCost = $rows2['sum(money)'];
    }
    } else {
        echo $sqlGetTotalCost;
    }
    
    $sqlGetTotalYusuan = "SELECT sum(money) FROM `yusuanlist` WHERE year = ".$yearn." AND month = ".$monthn." AND username = '".$postData->username."'";
    if($res3 = mysqli_query($db, $sqlGetTotalYusuan)) {
    while($rows3 = mysqli_fetch_assoc($res3)) {
        $monthTotalYusuan = $rows3['sum(money)'];
    }
    } else {
        echo $sqlGetTotalYusuan;
    }

    $jieyu = $monthTotalIn - $monthTotalCost;
    if($monthTotalCost - $monthTotalYusuan > 0) {
        $chaozhi = $monthTotalCost - $monthTotalYusuan;
    } else {
        $chaozhi = 0;
    }

    $sqlGetCostPercent = "SELECT type,sum(money) FROM `shouzhilist` WHERE year = 2017 AND money < 0 AND month = 11 AND username='".$postData->username."' group by shouzhilist.type";
    if($resgb = mysqli_query($db, $sqlGetCostPercent)) {
    while($rowsgb = mysqli_fetch_assoc($resgb)) {
        $costPercent[] = array(
            "type" => $rowsgb['type'],
            "value" => ($monthTotalCost==0?0: $rowsgb['sum(money)']),
    );
    }
    } else {
        $costPercent = $sqlGetCostPercent;
    }
    $sqlUpdateMonth = "UPDATE `monthlist` SET username='".$postData->username."', zhanbi='".json_encode($costPercent)."',daycost='".$monthTotalCost/$days."',totalin='".$monthTotalIn."',totalout='".$monthTotalCost."',jieyu='".$jieyu."',chaozhi='".$chaozhi."',year='".$yearn."',month='".$monthn."'";
    if($resupd = mysqli_query($db, $sqlUpdateMonth)) {

    }
    $answer = array(
        "yusuan" => $monthTotalYusuan,
        "year" => $yearn,
        "month" => $monthn,
        "zhanbi" => $costPercent,
        "totalin" => $monthTotalIn,
        "totalout" => $monthTotalCost,
        "jieyu" => $jieyu,
        "chaozhi" => $chaozhi
    );
    if(get_magic_quotes_gpc()) {//去掉自动加的反斜杠
        echo stripslashes(json_encode($answer));
    } else {
        echo json_encode($answer);
    }
}