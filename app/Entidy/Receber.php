<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Receber
{


    public $id;
    public $qtd;
    public $data;
    public $recebido;
    public $usuarios_id;
    public $clientes_id;
    public $regioes_id;
    public $rotas_id;
    public $gaiola_id;


    public function cadastar()
    {


        $obdataBase = new Database('receber');

        $this->id = $obdataBase->insert([

            'qtd'                           => $this->qtd, 
            'data'                          => $this->data, 
            'recebido'                      => $this->recebido,
            'usuarios_id'                   => $this->usuarios_id, 
            'clientes_id'                   => $this->clientes_id,
            'regioes_id'                    => $this->regioes_id,
            'rotas_id'                      => $this->rotas_id,
            'gaiola_id'                     => $this->gaiola_id
        
        ]);

        return true;
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('receber'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('receber'))->select('COUNT(*) as qtd', 'receber', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('receber'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public function atualizar()
    {
        return (new Database('receber'))->update('id = ' . $this->id, [

            'qtd'                           => $this->qtd, 
            'data'                          => $this->data, 
            'recebido'                      => $this->recebido,
            'usuarios_id'                   => $this->usuarios_id, 
            'clientes_id'                   => $this->clientes_id,
            'regioes_id'                    => $this->regioes_id,
            'rotas_id'                      => $this->rotas_id,
            'gaiola_id'                     => $this->gaiola_id
        
        ]);
    }

    public function excluir()
    {
        return (new Database('receber'))->delete('id = ' . $this->id);
    }


    public static function getEmail($email)
    {

        return (new Database('receber'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
