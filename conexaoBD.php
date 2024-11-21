<?php
//pegando as variáveis de ambiente
require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Dados relativos ao Banco de Dados
$host = $_ENV['DB_HOST'];
$usuario = $_ENV['DB_USER'];
$senha = $_ENV['DB_PASS'];
$bd = $_ENV['DB_NAME'];
$port = $_ENV['DB_PORT'];
// $endpointId = $_ENV['DB_ENDPOINT'];
// $ssl_path = $_ENV['SSL_PATH'];

// $ssl_cert_path = __DIR__ . './certs/isrgrootx1.pem';

// Faz a conexão ao banco de dados usando PDF

// // forma local
$conecta = new PDO("mysql:dbname=$bd; host=$host; port=$port; charset=utf8", $usuario, $senha);

// forma de produção
// Construir a string DSN
// $dsn = "pgsql:host=$host;port=$port;dbname=$bd;options=--endpoint=$endpointId;sslmode=require;sslrootcert=$ssl_cert_path";
// $dsn = "pgsql:host=$host;port=$port;dbname=$bd;sslmode=require;sslrootcert=$ssl_cert_path";
// $dsn = "pgsql:host=$host;port=$port;dbname=$bd;?options=endpoint%3D$endpointId;sslmode=require";

// $newpassword = $senha . '$' . $endpointId;
// Criar a conexão PDO
// $pdo = new PDO($dsn, $usuario, $newpassword);

$conecta->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
