<?php
    // Dados relativos ao Banco de Dados
    $host = "localhost";
    $usuario = "root";
    $senha = "Etec500@";
    $bd = "labweb";

    // Faz a conexão ao banco de dados usando PDF
    $conecta = new PDO("mysql:dbname=$bd; host=$host; port=3306; charset=utf8", $usuario, $senha);
    $conecta->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>