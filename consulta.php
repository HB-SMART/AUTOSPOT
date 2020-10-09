<?php
$servidor = "localhost";
$usuario = "root";
$senha = "";
$dbname = "gerardocs";


$con = new PDO("mysql:host=localhost;dbname=gerardocs", 'root', '', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

$conn = mysqli_connect($servidor, $usuario, $senha, $dbname);


/*
$sql="select * from alunos";

//Seleciona os registro

$resultado = mysqli_query($conn,$sql);
while ($row = mysqli_fetch_object($resultado)){

    echo $row['nome'];

}*/

$result_msg_cont = "SELECT * FROM alunos ORDER BY id";

//Seleciona os registros
$resultado_msg_cont = $con->prepare($result_msg_cont);
$resultado_msg_cont->execute();
$result=array();

while ($row = $resultado_msg_cont->fetch(PDO::FETCH_ASSOC)) {
   
                               $result[]=$row;   
                               #  echo $row['nome'];
                                   
                                           
       

 }
 echo json_encode($result);