CREATE DATABASE IF NOT EXISTS labweb;

USE labweb;

 /* Tabela pesssoas armazenará todos os dados pessoais de todos os usuários da plataforma,
 independente do perfil que possua (cliente, técnico ou administrador) */
CREATE TABLE IF NOT EXISTS pessoas (
	cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefoneFixo VARCHAR(15),
    telefoneCelular VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
	senha VARCHAR(255) NOT NULL,
    tipo_usuario INT NOT NULL,
    -- Tipo de usuario
        -- 1 - Administrador
        -- 2 - Técnico
        -- 3 - Cliente
    
    CONSTRAINT pk_pessoa PRIMARY KEY (cpf)
);

 /* Tabela técnicos armazenará todos os dados profissionais dos técnicos,
 os dados pessoais deles serão consultados através da chave estrangeira cpf desta tabela */
CREATE TABLE IF NOT EXISTS tecnicos (
	matricula INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(20) NOT NULL,
    registro VARCHAR(15) NOT NULL,
    dataAdmissao DATE NOT NULL,
    dataRecisao DATE,
    statusTecnico BOOLEAN NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    
    CONSTRAINT pk_tecnico PRIMARY KEY (matricula),
    CONSTRAINT uk_registro UNIQUE KEY (registro),
    CONSTRAINT fk_tec_pessoa FOREIGN KEY (cpf) REFERENCES pessoas (cpf)
);

 /* Tabela admistradores armazenará todos os dados específicos dos administradores,
 os dados pessoais deles serão consultados através da chave estrangeira cpf desta tabela */
CREATE TABLE IF NOT EXISTS administradores (
	matricula INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(20) NOT NULL,
    dataAdmissao DATE NOT NULL,
    dataRecisao DATE,
    statusAdministrador BOOLEAN NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    
    CONSTRAINT pk_administrador PRIMARY KEY (matricula),
    CONSTRAINT fk_adm_pessoa FOREIGN KEY (cpf) REFERENCES pessoas (cpf)
);

 /* Tabela clientes armazenará todos os dados específicos dos clientes,
 os dados pessoais deles serão consultados através da chave estrangeira cpf desta tabela */
CREATE TABLE IF NOT EXISTS clientes (
	numero INT NOT NULL AUTO_INCREMENT,
    empresa VARCHAR(20) NOT NULL,
    statusUsuarios BOOLEAN NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    
    CONSTRAINT pk_usuario PRIMARY KEY (numero),
    CONSTRAINT fk_user_pessoa FOREIGN KEY (cpf) REFERENCES pessoas (cpf)
);

 /* Tabela experimentos armazenará todos os dados específicos aos experimentos cadastrados pelos técnicos */
CREATE TABLE IF NOT EXISTS experimentos (
	numeroLote INT NOT NULL,
    dataExperimento DATE NOT NULL,
    dataValidadeExperimento DATE NOT NULL,
    peso DOUBLE NOT NULL,
    volume DOUBLE NOT NULL,
    presencaSM BOOLEAN NOT NULL,
    temperaturaLote DOUBLE NOT NULL,
    ph DOUBLE NOT NULL,
    condicaoExperimento VARCHAR(20) NOT NULL,
    obsExperimento VARCHAR(255) NOT NULL,
    matriculaTecnico INT NOT NULL,
    
    CONSTRAINT pk_experimento PRIMARY KEY (numeroLote),
    CONSTRAINT fk_experimento_tecnico FOREIGN KEY (matriculaTecnico) REFERENCES tecnicos (matricula)
);