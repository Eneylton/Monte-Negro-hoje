<?php
require __DIR__ . '../../../vendor/autoload.php';

use   App\Db\Pagination;
use App\Entidy\Entregador;
use   App\Entidy\Regiao;
use   App\Entidy\Rota;
use App\Entidy\Veiculo;
use   App\Session\Login;

define('TITLE', 'Lista de Regiões');
define('BRAND', 'Regiões');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 're.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%" or 
    ro.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd     = Rota::getQtd($where);

$regioes  = Rota::getList('*','regioes');

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 5);

$listar = Regiao::getList('ro.id as id,
                           re.nome as nome,
                           ro.regioes_id as regioes_id ,
                           ro.nome as regiao','regioes AS re
                           INNER JOIN
                           rotas AS ro ON (re.id = ro.regioes_id)
                          ',$where, 're.id desc', $pagination->getLimit());


include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/rota/rota-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
    $(document).ready(function() {
        $('.editbtn').on('click', function() {
            $('#editmodal').modal('show');

            $tr = $(this).closest('tr');

            var data = $tr.children("td").map(function() {
                return $(this).text();
            }).get();

            $('#id').val(data[0]);
            $('#nome').val(data[1]);
            $('#regiao').val(data[2]);
            $('#regioes_id').val(data[3]);
        });
    });
</script>