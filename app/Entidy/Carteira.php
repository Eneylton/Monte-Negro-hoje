<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Carteira
{

    public $id;
    public $qtd;   
    public $valor;
    public $cod_id;
    public $entregadores_id;
   

    public function cadastar()
    {


        $obdataBase = new Database('carteira');

        $this->id = $obdataBase->insert([

           
            'qtd'                      => $this->qtd, 
            'valor'                    => $this->valor, 
            'cod_id'                   => $this->cod_id, 
            'entregadores_id'          => $this->entregadores_id 
        
        ]);

        return true;
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('carteira'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('carteira'))->select('COUNT(*) as qtd', 'carteira', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('carteira'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public static function getIDEntregador($fields, $table, $where, $order, $limit)
    {
        return (new Database('carteira'))->select($fields, $table, 'entregadores_id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public function atualizar()
    {
        return (new Database('carteira'))->update('id = ' . $this->id, [

            'qtd'                      => $this->qtd, 
            'valor'                    => $this->valor, 
            'cod_id'                   => $this->cod_id, 
            'entregadores_id'          => $this->entregadores_id 
        ]);
    }

    public function excluir()
    {
        return (new Database('carteira'))->delete('id = ' . $this->id);
    }


    public static function getEmail($email)
    {

        return (new Database('carteira'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
