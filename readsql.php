<?php
//fazer consultas no BD
class Consulta {
    private $usersdbpsql;

    public function __construct()
    {
        $jsonpsql = $_COOKIE['psql'];
        $dbpsql = json_decode($jsonpsql, true);

        $this->usersdbpsql = $dbpsql['users']; 
    }

    public function logindbpsql($nome, $senha)
    {
        $userlogado = array_filter($this->usersdbpsql, function ($user) use ($nome, $senha) {
            return $user['nome'] === $nome && $user['senha'] === $senha;
        });
    }
}
