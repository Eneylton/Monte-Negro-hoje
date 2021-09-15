<?php
require __DIR__ . '../../../vendor/autoload.php';

use  App\Db\Pagination;
use  App\Entidy\Cliente;
use  App\Entidy\Entregador;
use  App\Entidy\Servico;
use  App\Entidy\Setor;
use  App\Session\Login;

define('TITLE','Lista de Clientes');
define('BRAND','Clientes');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'cli.nome LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       s.nome LIKE "%'.str_replace(' ','%',$buscar).'%"
                       or 
                       st.nome LIKE "%'.str_replace(' ','%',$buscar).'%"
                      
                       ' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Cliente:: getQtd($where);


$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 5);

$listar = Cliente::getList(' cli.id AS id,
                             cli.nome AS nome,
                             s.nome AS servicos,
                             st.nome AS setores,
                             cli.servicos_id as servicos_id,
                             cli.setores_id as setores_id', 'clientes AS cli
                             INNER JOIN
                             servicos AS s ON (cli.servicos_id = s.id)
                             INNER JOIN
                             setores AS st ON (cli.setores_id = st.id)', $where, 'cli.id desc', $pagination->getLimit());

$entregadores   = Entregador   :: getList('*','entregadores');
$setores        = Setor        :: getList('*','setores');
$servicos       = Servico      :: getList('*','servicos');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/cliente/cliente-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$(document).ready(function(){
    $('.editbtn').on('click', function(){
        $('#editmodal').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#nome').val(data[1]);
        $('#servicos').val(data[2]);
        $('#setores').val(data[3]);
        $('#servicos_id').val(data[4]);
        $('#setores_id').val(data[5]);
      
    });
});
</script>
