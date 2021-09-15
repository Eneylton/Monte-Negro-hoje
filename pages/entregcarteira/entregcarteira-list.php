<?php
require __DIR__ . '../../../vendor/autoload.php';

use  \App\Db\Pagination;
use   App\Entidy\Entregador;
use App\Entidy\Regiao;
use App\Entidy\Rota;
use App\Entidy\Veiculo;
use   \App\Session\Login;

define('TITLE', 'Carteiras');
define('BRAND', 'Carteiras');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'e.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%" 
    or 
    e.telefone LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    e.email LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    r.descricao LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    v.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    re.nome  LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

if(isset($_POST['id'])){
    $id= $_POST['id'];

    $regioes = Regiao:: getList('*','regioes','id'.$id);

    foreach ($regioes as $item) {
        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
     }
    
}

$qtd = Entregador::getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 5);

$listar = Entregador::getList('e.id as id,e.nome as entregador,e.cpf as cpf,e.telefone as telefone,e.email as email,e.banco as banco,e.veiculos_id as veiculos_id,
                               e.agencia as agencia,e.conta as conta,e.pix as pix,re.nome as regiao,r.nome as rota,v.nome as veiculo', 
                               'entregadores AS e
                                INNER JOIN
                               rotas AS r ON (e.rotas_id = r.id)
                                INNER JOIN
                               regioes AS re ON (e.regioes_id = re.id)
                                INNER JOIN
                               veiculos AS v ON (e.veiculos_id = v.id)', $where, 'e.id desc', $pagination->getLimit());

$rotas = Rota:: getList('*','veiculos');
$veiculos = Veiculo:: getList('*','veiculos');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/entregcarteira/entregcarteira-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$("#rotas_id").on("change", function(){
   
   var idEstado = $("#rotas_id").val();
   $.ajax({
       url:'entregador-list.php',
       type:'POST',
       data:{id:idEstado},
      
       success:function(data){
           $("#regioes_id").css({'display':'block'});
           $("#regioes_id").html(data);
       }
   })

});

</script>

<script>
$("#rotas_cod").on("change", function(){
   
   var idEstado = $("#rotas_cod").val();
   $.ajax({
       url:'entregador-list.php',
       type:'POST',
       data:{id:idEstado},
       beforeSend:function(){
           $("#regiao").css({'display':'block'});
           $("#regiao").html("carregando....");
       },
       success:function(data){
           $("#regiao").css({'display':'block'});
           $("#regiao").html(data);
       }
   })

});

</script>

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
            $('#telefone').val(data[2]);
            $('#email').val(data[3]);
            $('#banco').val(data[4]);
            $('#agencia').val(data[5]);
            $('#conta').val(data[6]);
            $('#rotas_id').val(data[7]);
            $('#regioes_id').val(data[8]);
            $('#veiculos_id').val(data[9]);
            $('#rota').val(data[10]);
            $('#regiao').val(data[11]);

        });
    });
</script>