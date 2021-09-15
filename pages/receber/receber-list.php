<?php
require __DIR__ . '../../../vendor/autoload.php';

use  \App\Db\Pagination;
use App\Entidy\Cliente;
use App\Entidy\Gaiola;
use   App\Entidy\Receber;
use App\Entidy\Regiao;
use App\Entidy\Rota;
use   \App\Session\Login;

define('TITLE','Receber Itens');
define('BRAND','Conferência de itens');


Login::requireLogin();

if(isset($_POST['id'])){
    $id= $_POST['id'];

    $rotas = Rota:: getList('*','rotas','regioes_id= '.$id,null,null);

    foreach ($rotas as $item) {
        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
     }
    
}



$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'cli.nome LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       id LIKE "%'.str_replace(' ','%',$buscar).'%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Receber:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 10);

$regioes = Regiao:: getList('*','regioes');

$gaiolas = Gaiola:: getList('*','gaiola');

$listar = Receber::getList('r.id AS id,
r.data AS data,
r.qtd AS qtd,
r.recebido AS recebido,
cli.nome AS cliente,g.nome as gaiola','receber AS r
INNER JOIN
clientes AS cli ON (r.clientes_id = cli.id)
INNER JOIN
gaiola AS g ON (r.gaiola_id = g.id)',$where, 'r.id DESC',$pagination->getLimit());

$clientes = Cliente :: getList('*','clientes',null,' nome ASC');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/receber/receber-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$("#regioes").on("change", function(){
   
   var idEstado = $("#regioes").val();
   $.ajax({
       url:'receber-list.php',
       type:'POST',
       data:{id:idEstado},
      
       success:function(data){
           $("#rota").css({'display':'block'});
           $("#rota").html(data);
       }
   })

});

</script>

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
    
    });
});
</script>

<script>
$(document).ready(function(){
    $('.editbtn2').on('click', function(){
        $('#editmodal2').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#nome').val(data[1]);
    
    });
});
</script>



