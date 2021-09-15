<?php

require __DIR__ . '../../../vendor/autoload.php';

use  \App\Entidy\Rota;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();

if (isset($_POST['nome'])) {
   
    $item = new Rota;
    $item->nome                  = $_POST['nome'];
    $item->regioes_id            = $_POST['regioes_id'];
  
    $item->cadastar();

    header('location: rota-list.php?status=success');
    exit;
}
