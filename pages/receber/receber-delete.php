<?php 

require __DIR__.'../../../vendor/autoload.php';

use \App\Entidy\Receber;
use   \App\Session\Login;


Login::requireLogin();



if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Receber::getID('*','receber',$_GET['id'],null,null);

if(!$value instanceof Receber){
    header('location: index.php?status=error');

    exit;
}



if(!isset($_POST['excluir'])){
    
 
    $value->excluir();

    header('location: receber-list.php?status=del');

    exit;
}

