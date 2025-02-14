Banco de Dados para Sistema de Gerenciamento de Ordem de Serviço para Oficina Mecânica

Este é um sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica. O sistema permite o cadastro de clientes, veículos, mecânicos e a criação de ordens de serviço com serviços e peças associadas.

Funcionalidades

Cadastro de clientes, veículos e mecânicos.

Registro de ordens de serviço (OS) com status e previsão de conclusão.

Associação de serviços e peças a uma OS.

Cálculo automático do valor total da OS.

Integridade referencial com relacionamentos entre tabelas.

Requisitos

MySQL Server

Um gerenciador de banco de dados (ex: MySQL Workbench, DBeaver, HeidiSQL)

Estrutura do Banco de Dados

O sistema é baseado no seguinte esquema relacional:

Cliente: Nome, Endereço, Telefone, Documento, Número do Documento

Veículo: Cliente associado, Marca, Modelo, Ano, Placa

Mecânico: Nome, Endereço, Especialidade

Ordem de Serviço: Veículo, Mecânico, Data de Emissão, Tipo, Status, Valor Total

Serviços: Descrição, Valor

Peças: Nome, Valor

Relação entre OS e Peças: Peças utilizadas em cada OS

Instalação

Clone o repositório para sua máquina local:

git clone https://github.com/seu-usuario/sistema-oficina.git

Importe o arquivo SQL no seu banco de dados MySQL.

Conecte-se ao banco de dados e execute as consultas conforme necessário.

Uso

Cadastre clientes e seus respectivos veículos.

Adicione mecânicos e registre ordens de serviço.

Associe serviços e peças a cada OS.

Monitore o status das ordens de serviço.

Contribuição

Fique à vontade para contribuir com melhorias. Basta abrir um Pull Request ou relatar problemas na seção de Issues.
