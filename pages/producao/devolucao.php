<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Devolucao;
use App\Entidy\Logistica;
use App\Entidy\Receber;
use App\Session\Login;

Login::requireLogin();


if (!isset($_GET['id2']) or !is_numeric($_GET['id2'])) {

    header('location: index.php?status=error');

    exit;
}

$value = Logistica:: getID('*','logisticas',$_GET['id2'],null,null);

$receber_item = Receber :: getID('*','receber',$_GET['receber_id2'],null,null);

$receber_qtd = $receber_item->qtd;


if (!$value instanceof Logistica) {
    header('location: index.php?status=error');

    exit;
}


$valor1 = 0;
$valor2 = 0;
$calculo = 0;
$calculo2 = 0;

if (isset($_GET['cod_id2'])) {

    $valor1 = $value->qtd;

    $qtd_atual = (int)$valor1;


    $valor2 = $_GET['qtd2'];

    $qtd_dev = (int)$valor2;

    if ($qtd_atual >= $qtd_dev) {

        $devolucao = new Devolucao;
        $devolucao->logisticas_id              = $_GET['id2'];
        $devolucao->cod_id                     = $_GET['cod_id2'];
        $devolucao->qtd                        = $_GET['qtd2'];
        $devolucao->entregadores_id            = $_GET['entregadores_id2'];
        $devolucao->receber_id                 = $_GET['receber_id2'];
        $devolucao->ocorrencias_id             = $_GET['ocorrencias_id2'];
        $devolucao->cadastar();

        $calculo = ($qtd_atual - $qtd_dev);
        $calculo2 = ($receber_qtd + $qtd_dev);

        $value->qtd = $calculo;
        $value->atualizar();

        $receber_item->qtd = $calculo2;
        $receber_item->atualizar();




        header('location: ../producao/producao-list.php?status=success');

        exit;
    }

    header('location: ../producao/producao-list.php?status=error2');
    exit;
}
