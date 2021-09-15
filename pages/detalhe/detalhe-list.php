<?php

require __DIR__ . '../../../vendor/autoload.php';

$alertaCadastro = '';

define('TITLE', 'Detalhes');
define('BRAND', 'Detalhes');

use App\Entidy\Entregador;
use  App\Session\Login;


Login::requireLogin();

if (!isset($_GET['id']) or !is_numeric($_GET['id'])) {

    header('location: entregcarteira-list.php?status=error');

    exit;
}

$entregadores = Entregador::getList('t.id as id,
                                     e.cod_id as codigo,
                                     t.nome as entregador,
                                     e.data as data_entrega,
                                     dev.data as data_devolucao,
                                     e.qtd as entrega,
                                     dev.qtd as devolucao,
                                     l.receber_id AS receber_id','logisticas AS l
                                     INNER JOIN
                                     entrega AS e ON (l.id = e.logisticas_id)
                                     left JOIN
                                     devolucao AS dev ON (l.id = dev.logisticas_id)
                                     INNER JOIN
                                     entregadores AS t ON (l.entregadores_id = t.id)
                                     INNER JOIN
                                     receber AS r ON (l.receber_id = r.id)','l.receber_id='.$_GET['id']);

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/detalhe/detalhe-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script type="text/javascript">
var ctx = document.getElementById('myChart2').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [

            <?php
           
            foreach ($entregadores as $item) {
           
                echo "'".$item->entregador."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• ENTREGAS •',
            data: [
                <?php
            foreach ($entregadores as $item) {
                echo "'".$item->entrega."',";
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
            foreach ($entregadores as $item) {
                echo "'".$item->devolucao."',";
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
