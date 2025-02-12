CREATE DATABASE Oficina;

CREATE TABLE cliente(
	
);

CREATE TABLE ordemServico(
	idOrdemServico INT PRIMARY KEY AUTO_INCREMENT,
    dataEmissao DATETIME NOT NULL,
    valorServico DECIMAL(10,2) NOT NULL,
    statusServico ENUM('Em Manutenção', 'Em Avaliação', 'Concluido'),
    previsaoConclusao DATETIME NOT NULL
);

CREATE TABLE mecanicos(
	idMecanino INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Especialidade VARCHAR(50) NOT NULL
);