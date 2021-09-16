<?php

if (isset($_GET['status'])) {

   switch ($_GET['status']) {
      case 'success':
         $icon  = 'success';
         $title = 'Parabéns';
         $text = 'Cadastro realizado com Sucesso !!!';
         break;

      case 'del':
         $icon  = 'error';
         $title = 'Parabéns';
         $text = 'Esse recebimento foi excluido !!!';
         break;

      case 'edit':
         $icon  = 'warning';
         $title = 'Parabéns';
         $text = 'Cadastro atualizado com sucesso !!!';
         break;


      default:
         $icon  = 'error';
         $title = 'Opss !!!';
         $text = 'Algo deu errado entre em contato com admin !!!';
         break;
   }

   function alerta($icon, $title, $text)
   {
      echo "<script type='text/javascript'>
      Swal.fire({
        type:'type',  
        icon: '$icon',
        title: '$title',
        text: '$text'
       
      }) 
      </script>";
   }

   alerta($icon, $title, $text);
}


$resultados = '';
$dia = '';
$cor = '';

foreach ($listar as $item) {

   switch ($item->qtd) {
      case '10':
         $cor2 = "badge-danger";
         $qtd = "10";
         $msn = " ITENS PEDENTES";
         $disabled = "";
         break;

      case '9':
         $cor2 = "badge-danger";
         $qtd = "9";
         $msn = "Pendentes";
         $disabled = "";
         break;

      case '8':
         $cor2 = "badge-danger";
         $qtd = "8";
         $msn = "Pendentes";
         $disabled = "";
         break;


      case '7':
         $cor2 = "badge-danger";
         $qtd = "7";
         $msn = "Pendentes";
         $disabled = "";
         break;


      case '6':
         $cor2 = "badge-danger";
         $qtd = "6";

         $msn = "Pendentes";
         $disabled = "";
         break;


      case '5':
         $cor2 = "badge-danger";
         $qtd = "5";
         $msn = "Pendentes";
         $disabled = "";
         break;
      case '4':
         $cor2 = "badge-danger";
         $qtd = "4";
         $msn = "Pendentes";
         $disabled = "";
         break;

      case '3':
         $cor2 = "badge-danger";
         $qtd = "3";
         $msn = " Pendentes";
         $disabled = "";
         break;

      case '2':
         $cor2 = "badge-danger";
         $qtd = "2";
         $msn = "Pendentes";
         $disabled = "";
         break;

      case '1':
         $cor2 = "badge-danger";
         $qtd = "1";
         $msn = "Pendente";
         $disabled = "";
         break;

      case '0':
         $cor2 = "badge-success";
         $qtd = "";
         $msn = "Todos os itens foram distribuidos";
         $disabled = "disabled";
         break;

      default:
         $cor2 = "badge-light";
         $qtd = $item->qtd;
         $msn = " DISPONIVEIS PARA ENTREGA";
         $disabled = "";
         break;
   }


   $resultados .= '<tr>
                      <td>' . $item->id . '</td>
                      <td style="text-transform:uppercase">' . date('d/m/Y  Á\S  H:i:s', strtotime($item->data)) . '</td>
                      <td style="text-transform:uppercase">' . $item->cliente . '</td>
                      <td style="text-transform:uppercase"> <h3><span class="badge badge-pill badge-warning"> <i class="fa fa-plus-circle" aria-hidden="true"></i> &nbsp;' . $item->recebido . '&nbsp; </span></h3> </td>
                      <td style="text-transform:uppercase"> <h3><span class="badge badge-pill ' . $cor2 . '"> <i class="fa fa-plus-circle" aria-hidden="true"></i> &nbsp;' . $item->qtd . '&nbsp; ' . $msn . '</span></h3> </td>
                      <td style="text-transform:uppercase"> <h3><span class="badge badge-pill badge-primary"> <i class="fa fa-check-circle" aria-hidden="true"></i>
                      &nbsp;' . $item->gaiola . '</span></h3> </td>
                       
                      <td style="text-align: center;">
                        
                      <a href="../detalhe/detalhe-list.php?id=' . $item->id . '">
                      <button type="button" class="btn btn-light"> <i class="fa fa-th-list" aria-hidden="true"></i> &nbsp; DETALHES </button>
                      </a>
                      &nbsp;
                       <a href="../logisticas/logistica-list.php?id=' . $item->id . '">
                       <button type="button" class="btn btn-success" ' . $disabled . '> <i class="fa fa-paper-plane" aria-hidden="true"></i> &nbsp; DISTRIBUIR ITENS </button>
                       </a>
                      
                       &nbsp;
                       <a href="receber-delete.php?id=' . $item->id . '">
                       <button type="button" class="btn btn-danger" ' . $disabled . '>  <i class="fas fa-trash"></i></button>
                       </a>


                      </td>
                      </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="7" class="text-center" > Nenhum item recebido até o momento !!!!! </td>
                                                     </tr>';


unset($_GET['status']);
unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
   $class = $pagina['atual'] ? 'btn-primary' : 'btn-secondary';
   $paginacao .= '<a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">

                  <button type="button" class="btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  </a>';
}

?>
<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card card-purple">
               <div class="card-header">

               <form method="get">
                     <div class="row my-7">
                        <div class="col-4">

                           <label>Buscar por Clientes</label>
                           <input type="text" class="form-control" name="buscar" value="<?= $buscar ?>">

                        </div>


                        <div class="col d-flex align-items-end">
                           <button type="submit" class="btn btn-warning" name="">
                              <i class="fas fa-search"></i>

                              Pesquisar

                           </button>

                        </div>


                     </div>

                  </form>
               </div>

               <div class="table-responsive">

                  <table class="table table-bordered table-dark table-bordered table-hover table-striped">
                     <thead>
                     <tr>
                              <td colspan="9">
                                 <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#modal-default" > <i class="fas fa-plus"></i> &nbsp; Novo</button>
                                  
                                 <button type="submit" class="btn btn-default float-right" data-toggle="modal" data-target="#modal-data"> <i class="fas fa-print"></i> &nbsp; IMPRIMIR RELATÓRIOS</button>


                              </td>
                           </tr>

                           <tr>
                           <th style="text-align: left; width:80px"> CÓDIGO </th>

                           <th> DATA DO RECEBIMENTO </th>
                           <th> CLIENTES </th>
                           <th> RECEBIDO </th>
                           <th> QUANTIDADE </th>
                           <th> GAIOLA </th>

                           <th style="text-align: center; width:400px"> AÇÃO </th>
                        </tr>
                     </thead>
                     <tbody>
                        <?= $resultados ?>
                     </tbody>

                  </table>

               </div>


            </div>

         </div>

      </div>

   </div>

</section>

<?= $paginacao ?>


<div class="modal fade" id="modal-default">
   <div class="modal-dialog modal-lg">
      <div class="modal-content bg-light">
         <form action="./receber-insert.php" method="post" enctype="multipart/form-data">

            <div class="modal-header">
               <h4 class="modal-title">Novo receber
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
              
            <div class="form-group">
                  <div class="row">
                     <div class="col-6">
                        <div class="form-group">
                           <label>Data do Recebimento </label>
                           <input value="<?php
                                          date_default_timezone_set('America/Sao_Paulo');
                                          echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local" class="form-control" name="data" required>
                        </div>
                     </div>
                     <div class="col-6">
                        <div class="form-group">
                           <label>Quantidade recebida</label>
                           <input style="text-transform:uppercase" type="text" class="form-control" name="qtd" required>
                        </div>
                     </div>
                     <div class="col-6">
                     <div class="form-group">
                        <label>Regiao</label>
                        <select class="form-control select" style="width: 100%;" name="regioes" id="regioes">
                           <option value=""> Selecione uma região </option>
                           <?php

                           foreach ($regioes as $item) {
                              echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>
                     </div>

                  </div>
                  <div class="col-6">
                     <div class="form-group">

                        <label>Rota</label>
                        <select class="form-control" name="rota" id="rota" ></select>
                     </div>
                  </div>

                     <div class="col-6">
                        <div class="form-group">
                           <label>Clientes</label>
                           <select class="form-control select" style="width: 100%;" name="clientes_id" required>
                              <option value=""> Selecione uma cliente </option>
                              <?php

                              foreach ($clientes as $item) {
                                 echo '<option style="text-transform:capitalize" value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>
                        </div>
                     </div>

                     <div class="col-6">
                        <div class="form-group">
                           <label>Gaiolas</label>
                           <select class="form-control select" style="width: 100%;" name="gaiolas_id" required>
                              <option value=""> Selecione uma gaiola </option>
                              <?php

                              foreach ($gaiolas as $item) {
                                 echo '<option style="text-transform:capitalize" value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>
                        </div>
                     </div>
                  </div>

               </div>

              

            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Salvar</button>
            </div>

         </form>

      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<!-- EDITAR -->


<div class="modal fade" id="modal-data">
      <div class="modal-dialog modal-lg">
         <div class="modal-content ">
            <form action="./receber-gerar.php" method="GET" enctype="multipart/form-data">

               <div class="modal-header">
                  <h4 class="modal-title">Relatórios
                  </h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="card-body">

                  <div class="form-group">

                     <div class="row">

                        <div class="col-lg-4 col-4">
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataInicio">
                        </div>


                        <div class="col-lg-4 col-4">
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataFim">
                        </div>


                        <div class="col-lg-4 col-4">

                           <select class="form-control select" name="clientes_id">
                              <option value=""> Clientes </option>
                              <?php

                              foreach ($clientes as $item) {
                                 echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>

                        </div>

                     </div>
                  </div>

               </div>
               <div class="modal-footer justify-content-between">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                  <button type="submit" class="btn btn-primary">Gerar relatório</button>
               </div>

            </form>

         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>