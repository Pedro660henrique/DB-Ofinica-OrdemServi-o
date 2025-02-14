CREATE DATABASE Oficina;
USE Oficina;


CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150) NOT NULL,
    Telefone VARCHAR(16) NOT NULL,
    Documento ENUM('RG', 'CPF', 'CNPJ') NOT NULL,
    numeroDocumento VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE veiculos (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idCliente INT NOT NULL,
    Marca VARCHAR(30) NOT NULL,
    Modelo VARCHAR(30) NOT NULL,
    Ano INT NOT NULL,
    Placa VARCHAR(10) NOT NULL UNIQUE,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente) ON DELETE CASCADE
);


CREATE TABLE mecanicos (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150) NOT NULL,
    Especialidade VARCHAR(50) NOT NULL
);


CREATE TABLE ordemServico (
    idOrdemServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idVeiculo INT NOT NULL,
    idMecanico INT NOT NULL,
    dataEmissao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valorTotal DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Tipo ENUM('Conserto', 'Revisão Periódica') NOT NULL,
    DescricaoServico VARCHAR(255) NOT NULL,
    statusServico ENUM('Em Manutenção', 'Em Avaliação', 'Concluído') NOT NULL,
    previsaoConclusao DATETIME NOT NULL,
    FOREIGN KEY (idVeiculo) REFERENCES veiculos(idVeiculo) ON DELETE CASCADE,
    FOREIGN KEY (idMecanico) REFERENCES mecanicos(idMecanico) ON DELETE SET NULL
);


CREATE TABLE servicos (
    idServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idOrdemServico INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0),
    FOREIGN KEY (idOrdemServico) REFERENCES ordemServico(idOrdemServico) ON DELETE CASCADE
);

CREATE TABLE pecas (
    idPeca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0)
);


CREATE TABLE ordemServicoPecas (
    idOrdemServico INT NOT NULL,
    idPeca INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (idOrdemServico, idPeca),
    FOREIGN KEY (idOrdemServico) REFERENCES ordemServico(idOrdemServico) ON DELETE CASCADE,
    FOREIGN KEY (idPeca) REFERENCES pecas(idPeca) ON DELETE CASCADE
);

