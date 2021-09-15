<?php

require __DIR__ . '../../../vendor/autoload.php';

use  \App\Entidy\Receber;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();

if (isset($_POST['qtd'])) {
   
    $item = new Receber;
    $item->qtd              = $_POST['qtd'];
    $item->recebido         = $_POST['qtd'];
    $item->data             = $_POST['data'];
    $item->usuarios_id      = $usuario ;
    $item->clientes_id      = $_POST['clientes_id'];
    $item->regioes_id       = $_POST['regioes'];
    $item->rotas_id         = $_POST['rota'];
    $item->gaiola_id       = $_POST['gaiolas_id'];
    $item->cadastar();

    header('location: receber-list.php?status=success');
    exit;
}
