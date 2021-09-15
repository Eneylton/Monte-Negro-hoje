<?php 

require __DIR__.'../../../vendor/autoload.php';

use \App\Entidy\Entregador;
use   \App\Session\Login;

Login::requireLogin();


if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Entregador::getID('*','entregadores',$_GET['id'],null,null);


if(!$value instanceof Entregador){
    header('location: index.php?status=error');

    exit;
}

if(isset($_GET['nome'])){
    
    $value->nome                = $_GET['nome'];
    $value->telefone            = $_GET['telefone'];
    $value->email               = $_GET['email'];
    $value->banco               = $_GET['banco'];
    $value->conta               = $_GET['conta'];
    $value->apelido             = $_GET['apelido'];
    $value->agencia             = $_GET['agencia'];
    // $value->rotas_id            = $_GET['rotas_id'];
    //$value->regioes_id          = $_GET['regioes_id'];
    $value->veiculos_id         = $_GET['veiculos_id'];
    $value->pix                 = $_GET['pix'];
    $value->cpf                 = $_GET['cpf'];
    $value->cnh                 = $_GET['cnh'];
    $value->renavam             = $_GET['renavam'];
    $value->tipo                = $_GET['tipo'];
    $value->forma_pagamento_id  = $_GET['forma_pagamento_id'];
    $value-> atualizar();

    header('location: entregador-list.php?status=edit');

    exit;
}


