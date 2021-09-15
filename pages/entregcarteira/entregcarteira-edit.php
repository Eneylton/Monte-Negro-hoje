<?php

require __DIR__ . '../../../vendor/autoload.php';

$alertaCadastro = '';

define('TITLE', 'Carteira');
define('BRAND', 'Carteira');

use \App\Entidy\Carteira;
use App\Entidy\Devolucao;
use  \App\Entidy\Entrega;
use App\Entidy\Entregador;
use   \App\Session\Login;

$total = 0;
$nome = "";

Login::requireLogin();

if (!isset($_GET['id']) or !is_numeric($_GET['id'])) {

    header('location: entregcarteira-list.php?status=error');

    exit;
}

$entregador = Entregador::getID('*','entregadores',$_GET['id'],null,null);

$nome =  $entregador->nome;

$value = Carteira::getIDEntregador('*','carteira',$_GET['id'],null,null);



if (!$value instanceof Carteira) {

    header('location: entregcarteira-list.php?status=error');
    
    exit;
}

$entregas = Entrega :: getList('t.nome AS nome, e.data AS data, SUM(e.qtd) AS total','entrega AS e
INNER JOIN
entregadores AS t ON (e.entregadores_id = t.id) ','t.id= '.$_GET['id']);

$entregas_dia = Entrega :: getList(' e.data as data,
t.nome as entregador,
e.qtd as total','entrega AS e
INNER JOIN
entregadores AS t ON (e.entregadores_id = t.id)','t.id='.$_GET['id']);

$devolucoes = Devolucao:: getList('o.nome as nome,dev.qtd as total',
                                  'devolucao AS dev INNER JOIN ocorrencias AS o ON (o.id = dev.ocorrencias_id)
                                   INNER JOIN entregadores AS e ON (e.id = dev.entregadores_id)',
                                  'month(dev.data) = MONTH(CURRENT_DATE()) AND e.id= '.$_GET['id']);

$ocorrencias = Devolucao:: getList('o.nome as nome,
dev.qtd as total',' devolucao AS dev
INNER JOIN
ocorrencias AS o ON (o.id = dev.ocorrencias_id)
INNER JOIN
entregadores AS e ON (e.id = dev.entregadores_id)','month(dev.data) = MONTH(CURRENT_DATE()) AND e.id= '.$_GET['id'].' group by o.nome');

$devolucoes_dia = Devolucao:: getList('e.qtd as total',' devolucao AS e
INNER JOIN
entregadores AS t ON (e.entregadores_id = t.id)','e.data >= current_date() AND t.id= '.$_GET['id']);

$diaria = Entrega :: getList('sum(e.qtd) as total','entrega AS e
INNER JOIN
entregadores AS t ON (e.entregadores_id = t.id)','t.id='.$_GET['id']);

$total = $diaria->total * 2;

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/carteira/carteira.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [

            <?php
           
            foreach ($entregas as $item) {
           
                echo "'".date('d / M', strtotime($item->data))."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• PRODUÇÃO MENSAL •',
            data: [
                <?php
            foreach ($entregas as $item) {
                echo "'".$item->total."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#6fe633a8',
                '#9d64a480',
                '#ee901d8f',
                '#d12f61',
                '#3d606c',
                '#F0379A',
                '#763dd986',
                '#d0ff0093',
                '#3794F0',
                '#ff00ff',
                '#ff0000',
                '#121212'
            ],
            borderColor: [
                '#6fe633a8',
                '#9d64a480',
                '#ee901d8f',
                '#d12f61',
                '#3d606c',
                '#F0379A',
                '#763dd986',
                '#d0ff0093',
                '#3794F0',
                '#ff00ff',
                '#ff0000',
                '#121212'
             
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

<script type="text/javascript">
var ctx = document.getElementById('myChart2').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [

            <?php
           
            foreach ($entregas_dia as $item) {
           
                echo "'".date('d / M', strtotime($item->data))."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• ENTREGAS •',
            data: [
                <?php
            foreach ($entregas_dia as $item) {
                echo "'".$item->total."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
             
            ],
            borderColor: [
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8'
             
            ],
            borderWidth: 1
        },
        
        {
            label: '• DEVOLUÇÕES •',
            data: [
                <?php
            foreach ($devolucoes as $item) {
                echo "'".$item->total."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000'
            ],
            borderColor: [
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000',
                '#ff0000'
             
            ],
            borderWidth: 1
        }
        
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

<script type="text/javascript">
var ctx = document.getElementById('myChart3').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: [

            <?php
           
            foreach ($ocorrencias as $item) {
           
                echo "'".$item->nome."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• OCORRÊNCIAS •',
            data: [
                <?php
            foreach ($ocorrencias as $item) {
                echo "'".$item->total."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#6fe633a8',
                '#9d64a480',
                '#ee901d8f',
                '#d12f61',
                '#3d606c',
                '#F0379A',
                '#763dd986',
                '#d0ff0093',
                '#3794F0',
                '#ff00ff',
                '#ff0000',
                '#121212'
            ],
            borderColor: [
                '#6fe633a8',
                '#9d64a480',
                '#ee901d8f',
                '#d12f61',
                '#3d606c',
                '#F0379A',
                '#763dd986',
                '#d0ff0093',
                '#3794F0',
                '#ff00ff',
                '#ff0000',
                '#121212'
             
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>


<script type="text/javascript">
var ctx = document.getElementById('myChart4').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: [

            <?php
           
            foreach ($ocorrencias as $item) {
           
                echo "'".$item->nome."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• OCORRÊNCIAS •',
            data: [
                <?php
            foreach ($ocorrencias as $item) {
                echo "'".$item->total."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#6fe633a8',
                '#9d64a480',
                '#ee901d8f',
                '#d12f61',
                '#3d606c',
                '#F0379A',
                '#763dd986',
                '#d0ff0093',
                '#3794F0',
                '#ff00ff',
                '#ff0000',
                '#121212'
            ],
            borderColor: [
                '#6fe633a8',
                '#9d64a480',
                '#ee901d8f',
                '#d12f61',
                '#3d606c',
                '#F0379A',
                '#763dd986',
                '#d0ff0093',
                '#3794F0',
                '#ff00ff',
                '#ff0000',
                '#121212'
             
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

