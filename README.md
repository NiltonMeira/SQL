# SQL
Repositório criado para exercícios e anotações de SQL

## Introdução ao BD
**"Data is the new oil"**.
O banco de dados é um lugar utiizado para armazenar e extrair dados.
A lingueM **SQL é muito utilizada para manipulação de bancos de dados.
Recomendação de Documentários -  **Privacidade Hackeada** e **O dilema das redes**.

### Qual a diferença entre dado e informação ?
Informação é o que você consegue atravez de um dado 
Ex: 18 é dado, 18 anos é uma informação

### O que são metadados ?
São basicamente informações sobre informações 
Ex: Por exemplo uma informação a respeito de um powerpoint

## banco de dados ?
É um conjunto organizado de dados.
Qualquer lugar que você possa guardar dados. Ex: Excel
SGBDs são utilzados para gerenciar os bancos de dados Ex: SQLserver

### Bancos de dados podem ser relacionais ou não relacionais
Relacionais - **Tabelas** estruturadas, com linhas e colunas, Ex: SQL 
Não relacionais - as informações podem ser organizadas de diferentes formas, Ex: NoSQL (not only SQL)

### SQL - Structured **Query** Language
Estrutura DBA - SQL - SGBD - Banco de dados

### SGBD
São utilizados para gerenciar os bancos de dados 

* Controle de redundancia 
* Controle de visões de dados 
* Controle de concôrrencia 
* Backup e Restauração 
* Autenticação e autorização de acesso 
* Controle de log
* Restrições e integridade 

## Modelagem de dados 
Modelar é criar formas visuais qeu representam a estrutura lógica de funcionamento do banco de dados de acordo com um modelo
* Tabelas (entidades)
* Colunas (atributos)

### MER Modelo de Endidade e Relacionamento 
Organiza os dados em uma Tabela

### DER - Diagrama de entidade e relacionamento 
Organiza os dados em forma de diagramas

Entidades fortes: Não dependem de outras entidades para existir 
Entidades fracas: Dependem de outra entidade para existir, como subclasses

Existem três tipos de diagramas:
* Conceitual
* Lógica 

### Modelo conceitual
Apresenta apenas os **atributos, ligações e a cardinalidade**.

#### Cardinalidade 
Representa a quantidade de vezes que um entidade pode estar sendo associado em um dado especfico 

#### Generalização e Especialização 
Uma entidade pode ser generalizada (Usando o triangulo), ou especializada dentro de um fluxgrama 

### Modelagem lógica
#### Chave primaria - Primary Key (PK)
Primary key é utlizado para identificação unica de uma entidade, Ex; ID

#### Chave estrangeira - foreign key(FK)
Foreign key é utilizado para relacionar duas tabelas diferntes

#### Cardinalidade 
* Zero ou um 
* Muitos
* Um 
* Um e apenas um
* Zero ou muitos 
* Um ou muitos 

### Tipos de dados 
* Int 
* Float
* char
* VArchar()
* Null




