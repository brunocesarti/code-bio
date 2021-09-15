<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

use App\Models\SaldoModel;

class Extrato extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $model = new SaldoModel();
      
        $data = $model->findAll();
      
        $response = [
            'status' => 200,
            'error' => null,
            'messages' => "Transações Encontradas",
            "data" => $data,
        ];
        return $this->respond($response);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $model = new SaldoModel();
      
        $data = $model->where(['id' => $id])->first();
      
        if ($data) {
            $response = [
                'status' => 200,
                'error' => null,
                'messages' => "Transações Encontradas",
                "data" => $data,
            ];
            return $this->respond($response);
        } else {
            return $this->failNotFound('Nenhuma transação encontrada com o id: ' . $id);
        }
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        return $this->failNotFound('O Extrato é atualizado ao fazer um depósito ou saque!');

    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        return $this->failNotFound('Não é possivel editar uma transação.');
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        return $this->failNotFound('Não é possivel atualizar uma transação.');
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        return $this->failNotFound('Não é possivel apagar uma transação.');

    }
}
