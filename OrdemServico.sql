CREATE DATABASE Oficina;

use Oficina;

CREATE TABLE Veiculos(
	idVeiculo int primary key auto_increment not null,
    idCliente int not null,
    Marca varchar(20) not null,
    Modelo varchar(20) not null,
    ano int not null,
    placa varchar(10) not null,
    foreign key (idCliente) references Cliente(idCliente)
);

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Telefone VARCHAR(16) NOT NULL,
    Documento ENUM('RG', 'CPF', 'CNPJ') NOT NULL,
    numeroDocumento VARCHAR(50) NOT NULL
);

CREATE TABLE mecanicos(
	idMecanino INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE ordemServico(
	idOrdemServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idVeiculo int not null,
    idMecanico int not null,
    dataEmissao DATETIME NOT NULL,
    valorServico DECIMAL(10,2) NOT NULL,
	Tipo ENUM('Concerto', 'Revisão Periódica') NOT NULL,
    DescricaoServico VARCHAR(250) NOT NULL,
    statusServico ENUM('Em Manutenção', 'Em Avaliação', 'Concluido') NOT NULL,
    previsaoConclusao DATETIME NOT NULL,
	FOREIGN KEY (idVeiculo) REFERENCES veiculos(idVeiculo),
    FOREIGN KEY (idMecanico) REFERENCES mecanicos(idMecanico) 
);

create table servicos(
	idServico int primary key auto_increment not null,
	idOrdemServico int not null,
    descricao varchar(250) not null,
    valor decimal(10,2) not null,
    FOREIGN KEY (idOrdemServico) REFERENCES ordemServico(idOrdemServico)
);

CREATE TABLE pecas (
    idPeca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE ordemServicoPecas (
    idOrdemServico INT NOT NULL,
    idPeca INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (idOrdemServico, idPeca),
    FOREIGN KEY (idOrdemServico) REFERENCES ordemServico(idOrdemServico),
    FOREIGN KEY (idPeca) REFERENCES pecas(idPeca) 
);

