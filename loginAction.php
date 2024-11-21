<?php
    if(isset($_POST["btnEntrar"])){

        // inicia uma seção
        session_start();

        // Carrega o arquivo de conexão ao BD
        require_once ('conexaoBD.php');

        // Pegando os valores dos campos CPF e Senha do Formulario via POST
        $login = $_POST['txtCpf'];
        $senha_hash =hash('sha256', $_POST['txtSenha']); // Usa a função hash com a Criptografia SHA256

        try{

            $sql = "SELECT * FROM pessoas WHERE cpf =".$login; // SQL para consultar usuario na tabela pessoas com o CPF digitado no formulario
            $resultado = $conecta->query($sql);
            if($resultado -> rowCount() == 1){
                foreach($resultado as $linha) {
                    if($linha['senha'] == $senha_hash){
                        //Cria as variáveis de Seção
                        $_SESSION['logado'] = $login;
                        $_SESSION['cpf'] = $linha['cpf'];
                        $_SESSION['nome'] = $linha['nome'];
                        $_SESSION['tipo_usuario'] = $linha['tipo_usuario'];

                        //Criar os cookies para simular o BD
                        if(!isset($_COOKIE['psql'])) {
                            //pegando o BD falso
                            $jsonbd = file_get_contents("psql.json");
                            $dadosbd = json_decode($jsonbd);
                            
                            //criar o cookie
                            setcookie('psql',$dadosbd, time() + (86400 * 30));
                        }


                        //Direciona para a Página Inicial
                        header ('Location: paginaInicial.php');
                    }else{
                        header ('Location: index.php'); // Caso a senha não corresponda carrega novamente a página de Login
                    }}
            }else{
                header ('Location: index.php'); // caso não tenha nenhum usuario no banco com o CPF carrega novamente a página de Login
            }
    
        }catch(PDOException $e){
            header ('Location: index.php'); // caso tenha algum erro carrega novamente a página de Login
        }    

    }else{
        header ('Location: index.php'); // Caso a solicitação vinda não senha do botão entrar carrega novamente a página de Login
    }

?>