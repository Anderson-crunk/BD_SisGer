-- =============================
-- ARQUIVO: modelo_banco.sql
-- =============================
-- Criação das tabelas principais do sistema de gerenciamento de ocorrências

-- Tabela de usuários
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL CHECK (tipo_usuario IN ('agente', 'admin'))
);

-- Tabela de ocorrências
CREATE TABLE Ocorrencia (
    id_ocorrencia SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('aberta', 'em andamento', 'encerrada')),
    id_usuario INTEGER NOT NULL REFERENCES Usuario(id_usuario)
);

-- Tabela de localizações vinculadas às ocorrências
CREATE TABLE Localizacao (
    id_localizacao SERIAL PRIMARY KEY,
    rua VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    uf CHAR(2),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    id_ocorrencia INTEGER NOT NULL REFERENCES Ocorrencia(id_ocorrencia)
);

-- Histórico de status da ocorrência
CREATE TABLE HistoricoStatus (
    id_historico SERIAL PRIMARY KEY,
    id_ocorrencia INTEGER NOT NULL REFERENCES Ocorrencia(id_ocorrencia),
    status VARCHAR(20) NOT NULL CHECK (status IN ('aberta', 'em andamento', 'encerrada')),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT
);

-- =============================
-- ARQUIVO: inserts_teste.sql
-- =============================
-- Inserção de dados de exemplo para testes

-- Usuários
INSERT INTO Usuario (nome, email, senha_hash, tipo_usuario)
VALUES
('João Silva', 'joao@email.com', 'senha123', 'agente'),
('Maria Lima', 'maria@email.com', 'senha456', 'admin');

-- Ocorrência
INSERT INTO Ocorrencia (titulo, descricao, status, id_usuario)
VALUES ('Furto em praça', 'Relato de furto de celular na praça central.', 'aberta', 1);

-- Localização
INSERT INTO Localizacao (rua, bairro, cidade, uf, latitude, longitude, id_ocorrencia)
VALUES ('Rua das Flores', 'Centro', 'Cidadela', 'SP', -23.5505, -46.6333, 1);

-- Histórico de Status
INSERT INTO HistoricoStatus (id_ocorrencia, status, observacao)
VALUES (1, 'aberta', 'Ocorrência registrada pelo agente.');

-- =============================
-- ARQUIVO: consultas.sql
-- =============================
-- Consultas úteis para o sistema

-- Listar todas as ocorrências com o nome do agente responsável
SELECT o.id_ocorrencia, o.titulo, o.status, u.nome AS responsavel
FROM Ocorrencia o
JOIN Usuario u ON o.id_usuario = u.id_usuario;

-- Consultar histórico de status de uma ocorrência
SELECT h.status, h.data_alteracao, h.observacao
FROM HistoricoStatus h
WHERE h.id_ocorrencia = 1
ORDER BY h.data_alteracao DESC;

-- Atualizar status da ocorrência
UPDATE Ocorrencia
SET status = 'em andamento'
WHERE id_ocorrencia = 1;

-- Remover um histórico de status específico
DELETE FROM HistoricoStatus
WHERE id_historico = 3;

-- =============================
-- SUGESTÕES DE ESTRUTURA GIT
-- =============================
-- 1. git init
-- 2. git add .
-- 3. git commit -m "Inicializa estrutura do banco de dados"
-- 4. git branch -M main
-- 5. git remote add origin https://github.com/Anderson-crunk/sistema-gerenciamento-ocorrencias.git
-- 6. git push -u origin main