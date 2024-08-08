
-- Tipo de usuario
-- 1 - Administrador
-- 2 - Técnico
-- 3 - Cliente

USE labweb;
-- Inserir um técnico
INSERT INTO pessoas (cpf, nome, telefoneCelular, email, rua, bairro, cidade, estado, senha, tipo_usuario)
VALUES ('11111111100', 'Abraao Fidelis', '9999-9999', 'abraaoo@example.com', 'Rua Principal', 'Centro', 'Cidade', 'UF', SHA2('senha123', 256), 2);

INSERT INTO tecnicos (cargo, registro, dataAdmissao, statusTecnico, cpf)
VALUES ('Técnico', 'CRQ12345', '2024-03-23', 1, '11111111100');

-- Inserir um administrador
INSERT INTO pessoas (cpf, nome, telefoneCelular, email, rua, bairro, cidade, estado, senha, tipo_usuario)
VALUES ('22222222200', 'Jesiane', '88888-8888', 'jesiane@example.com', 'Rua Principal 2', 'Centro', 'Cidade', 'UF', SHA2('senha123', 256), 1);

INSERT INTO administradores (cargo, dataAdmissao, statusAdministrador, cpf)
VALUES ('Técnico', '2024-03-23', 1, '22222222200');

-- Inserir um usuário
INSERT INTO pessoas (cpf, nome, telefoneCelular, email, rua, bairro, cidade, estado, senha, tipo_usuario)
VALUES ('33333333300', 'Paulo', '77777-7777', 'paulo@example.com', 'Rua Principal 3', 'Centro', 'Cidade', 'UF', SHA2('senha123', 256), 3);

INSERT INTO clientes (empresa, statusUsuarios, cpf)
VALUES ('Empresa Alifood', 1, '33333333300');

-- Inserir um experimento
INSERT INTO experimentos (numeroLote, dataExperimento, dataValidadeExperimento, peso, volume, presencaSM, temperaturaLote, ph, condicaoExperimento, obsExperimento, matriculaTecnico)
VALUES (1, '2024-03-23', '2024-03-30', 100.5, 50.2, 1, 25.3, 7.0, 'Condição de teste', 'Observações do teste', (SELECT matricula FROM tecnicos WHERE cpf = '11111111100'));