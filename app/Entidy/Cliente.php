<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Cliente
{


    public $id;
    public $nome;
    public $usuarios_id;
    public $servicos_id;
    public $setores_id;
    public $entregadores_id;
   

    public function cadastar()
    {


        $obdataBase = new Database('clientes');

        $this->id = $obdataBase->insert([

            'nome'                   => $this->nome, 
            'usuarios_id'            => $this->usuarios_id, 
            'servicos_id'            => $this->servicos_id, 
            'setores_id'             => $this->setores_id
        
        ]);

        return true;
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('clientes'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('clientes'))->select('COUNT(*) as qtd', 'clientes', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('clientes'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public function atualizar()
    {
        return (new Database('clientes'))->update('id = ' . $this->id, [
            'nome'                   => $this->nome, 
            'usuarios_id'            => $this->usuarios_id, 
            'servicos_id'            => $this->servicos_id, 
            'setores_id'             => $this->setores_id
        ]);
    }

    public function excluir()
    {
        return (new Database('clientes'))->delete('id = ' . $this->id);
    }


    public static function getEmail($email)
    {

        return (new Database('clientes'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
