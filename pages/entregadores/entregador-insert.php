<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Entregador;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();

if (isset($_POST['nome'])) {
   
    $value = new Entregador;

    $value->nome                = $_POST['nome'];
    $value->telefone            = $_POST['telefone'];
    $value->email               = $_POST['email'];
    $value->banco               = $_POST['banco'];
    $value->conta               = $_POST['conta'];
    $value->apelido             = $_POST['apelido'];
    $value->agencia             = $_POST['agencia'];
    $value->rotas_id            = $_POST['rota'];
    $value->regioes_id          = $_POST['regioes'];
    $value->veiculos_id         = $_POST['veiculos_id'];
    $value->pix                 = $_POST['pix'];
    $value->cpf                 = $_POST['cpf'];
    $value->cnh                 = $_POST['cnh'];
    $value->renavam             = $_POST['renavam'];
    $value->tipo                = $_POST['tipo'];
    $value->forma_pagamento_id  = $_POST['forma_pagamento_id'];
    $value->usuarios_id         = $usuario;
    $value->cadastar();

    header('location: entregador-list.php?status=success');
    exit;
}
