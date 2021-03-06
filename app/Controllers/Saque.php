<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

use App\Models\SaqueModel;
use App\Models\SaldoModel;

class Saque extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $model = new SaqueModel();
      
        $data = $model->findAll();
      
        $response = [
            'status' => 200,
            'error' => null,
            'messages' => "Saques Encontrados",
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
        $model = new SaqueModel();
      
        $data = $model->where(['id' => $id])->first();
      
        if ($data) {
            $response = [
                'status' => 200,
                'error' => null,
                'messages' => "Saques Encontrados",
                "data" => $data,
            ];
            return $this->respond($response);
        } else {
            return $this->failNotFound('Nenhum saque encontrado com o id: ' . $id);
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
        $model = new SaqueModel();

        $data = [
            'conta' => $this->request->getVar('conta'),
            'valor' => $this->request->getVar('valor'),
            'moeda' => $this->request->getVar('moeda'),
        ];

        $model->insert($data);

        $model2 = new SaldoModel();

        $data = [
            'conta' => $this->request->getVar('conta'),
            'valor' => ($this->request->getVar('valor'))*(-1),
            'moeda' => $this->request->getVar('moeda'),
            'operacao' => 'saque',
        ];

        $model2->insert($data);

        $response = [
            'status' => 200,
            'error' => null,
            'messages' => "Saque realizado com sucesso!",
        ];
      
        return $this->respondCreated($response);
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        return $this->failNotFound('N??o ?? possivel editar um saque.');
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        return $this->failNotFound('N??o ?? possivel atualizar um saque.');
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        return $this->failNotFound('N??o ?? possivel apagar um saque.');

    }
}
