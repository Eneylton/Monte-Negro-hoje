<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Regiao;
use \App\Entidy\Rota;
use   \App\Session\Login;

Login::requireLogin();


if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Rota::getID('*','rotas',$_GET['id'],null,null);


if(!$value instanceof Rota){
    header('location: index.php?status=error');

    exit;
}



if(isset($_GET['nome'])){
    
    $value->nome                   = $_GET['nome'];
    $value->regioes_id             = $_GET['regioes_id'];
   
    $value-> atualizar();

    header('location: rota-list.php?status=edit');

    exit;
}


