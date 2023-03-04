<?php
include "config.php";

$txt=$_POST['txt'];
$flag=$_POST['flag'];
$num=$_POST['num'];
$start=$_POST['start'];
//$txt="cce";
/*if($flag==0){
  $query="SELECT COUNT(*) as count FROM course";
}else{
$query="SELECT COUNT(*) as count FROM course C, professor P, department D
WHERE (C.professor_id=P.professor_id AND C.department_id=D.department_id)AND
(course_name LIKE '%".$txt."%' OR P.professor_name LIKE '%".$txt."%' OR
  D.department_name LIKE'%".$txt."%' OR C.course_description LIKE '%".$txt."%')
 ;";
}
if($res = mysqli_query($conn , $query)){

  if($row = mysqli_fetch_array($res)){
    $count=$row['count'];
    if ($count==0) echo json_encode("no results");
  }
}*/
$txt = str_replace(' ', '', $txt);
if($flag==1){


  $query="SELECT * FROM course C, professor P, department D
  WHERE (C.professor_id=P.professor_id AND C.department_id=D.department_id)AND
  (REPLACE(course_name, ' ', '') LIKE '%".$txt."%' OR REPLACE( P.professor_name, ' ', '') LIKE '%".$txt."%' OR
     REPLACE(D.department_name, ' ', '') LIKE '%".$txt."%' OR REPLACE(C.course_description, ' ', '') LIKE '%".$txt."%');";


}else if($flag==2){

  $query="SELECT * FROM course C, professor P, department D
WHERE (C.professor_id=P.professor_id AND C.department_id=D.department_id)AND
(REPLACE(course_name, ' ', '') LIKE '%".$txt."%' OR REPLACE( P.professor_name, ' ', '') LIKE '%".$txt."%' OR
  REPLACE(D.department_name, ' ', '') LIKE '%".$txt."%' OR REPLACE(C.course_description, ' ', '') LIKE '%".$txt."%')
ORDER BY C.course_id
LIMIT ".$start.",".$num.";";


}

if($res = mysqli_query($conn, $query)){
  $count=mysqli_num_rows($res);
    if($count>0){
      $i=0;
        while($row = mysqli_fetch_array($res)){
          if($i == $num)break;
          $i=$i+1;
            //echo $row['count'];
            $cname=$row['course_name'];
            $pname=$row['professor_name'];
            $dname=$row['department_name'];
            $cdesc=$row['course_description'];
            $arr[]=array("cname"=>$cname,"pname"=>$pname,"dname"=>$dname,"cdesc"=>$cdesc);
        }
        $ret[]=array("co"=>$count,"arr"=>$arr);
        echo json_encode($ret);
      }else echo json_encode("no results");
    }
    //else echo "Error: ".$query." ".$conn->error;


?>
