<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Devolucao
{


    public $id;
    public $cod_id;
    public $qtd;
    public $logisticas_id;
    public $ocorrencias_id;
    public $entregadores_id;
    public $receber_id;

    public function cadastar()
    {


        $obdataBase = new Database('devolucao');

        $this->id = $obdataBase->insert([

            'cod_id'                   => $this->cod_id, 
            'qtd'                      => $this->qtd,
            'logisticas_id'            => $this->logisticas_id,
            'entregadores_id'          => $this->entregadores_id,
            'receber_id'               => $this->receber_id,
            'ocorrencias_id'           => $this->ocorrencias_id
        
        ]);

        return true;
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('devolucao'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('devolucao'))->select('COUNT(*) as qtd', 'devolucao', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('devolucao'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public function atualizar()
    {
        return (new Database('devolucao'))->update('id = ' . $this->id, [

            'cod_id'                   => $this->cod_id, 
            'qtd'                      => $this->qtd,
            'logisticas_id'            => $this->logisticas_id,
            'entregadores_id'          => $this->entregadores_id,
            'receber_id'               => $this->receber_id,
            'ocorrencias_id'           => $this->ocorrencias_id
        ]);
    }

    public function excluir()
    {
        return (new Database('devolucao'))->delete('id = ' . $this->id);
    }


    public static function getEmail($email)
    {

        return (new Database('devolucao'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
