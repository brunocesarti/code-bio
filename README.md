# code-bio

Desafio técnico para avaliar os conhecimentos técnicos necessários para realização das atividades no dia a dia do cargo de Programador de Sistemas.

## Diagrama do Modelo ER

Nossa versão inicial da modelagem se deu desta forma:

![Modelo ER code-bio](https://user-images.githubusercontent.com/12937320/133000375-7d817ce0-753a-4651-b128-9658de94f246.png)

Durante implementação, optei por separar a tabela transações em 3 tabelas distintas para facilitar a construção da API.

![Modelo ER code-bio Modificado](https://github.com/brunocesarti/code-bio/blob/main/Modelo%20ER%20code-bio-tabelas-separadas.png)

Observando que o campo conta nas 3 tabelas, se referem a mesma conta de registro, e futuramente pode ser criada a tabela conta e vinculado o id da mesma como chave estrangeira nas tabelas deposito, saque e saldo. conforme necessidade e contexto da aplicação, a estrutura pode remodelada.


# Banco de dados

O script de construção do Banco de dados esta disponível na raiz do projeto com o nome "codebio.sql"

![Banco de dados](https://github.com/brunocesarti/code-bio/blob/main/documentacao/BD%20codebio.png)

O banco contém 3 tabelas:

Tabela deposito:

![Tabela deposito](https://github.com/brunocesarti/code-bio/blob/main/documentacao/tabela%20deposito.png)

Tabela saldo:

![Tabela saldo](https://github.com/brunocesarti/code-bio/blob/main/documentacao/tabela%20saldo.png)

Tabela saque:

![Tabela saque](https://github.com/brunocesarti/code-bio/blob/main/documentacao/tabela%20saque.png)


# Quadro de tarefas

Para melhor organização das tarefas e fluxos do projeto, optei por construir um quadro de tarefas (modelo Kanban), disponível em: https://github.com/brunocesarti/code-bio/projects/1

![Quadro de tarefas](https://github.com/brunocesarti/code-bio/blob/main/documentacao/kanban%20tarefas.png)

Também é possível gerenciar as issues atreladas ao quadro de tarefas:

Issues abertas:

![Issues abertas](https://github.com/brunocesarti/code-bio/blob/main/documentacao/issues%20abertas.png)

Issues fechadas:

![Issues fechadas](https://github.com/brunocesarti/code-bio/blob/main/documentacao/issues%20fechadas.png)

# Detalhes sobre a construção da API RESTful

Para implementação, utilizei o framework CodeIgniter, sua documentação esta disponível em: https://codeigniter4.github.io/userguide/

O desafio propõe a construção de endpoints para saque, deposito, saldo e extrato (extra), para execução dos mesmos foram construidas as rotas para os endpoints desejado:

![Rotas para os endpoints](https://github.com/brunocesarti/code-bio/blob/main/documentacao/Rotas%20geradas.png)

A aplicação foi testada, utilizando da ferramenta Postman ( https://www.postman.com/ ):

![Postman](https://github.com/brunocesarti/code-bio/blob/main/documentacao/Postman.png)

A API construida utililiza da API do Banco Central PTAX - https://dadosabertos.bcb.gov.br/dataset/taxas-de-cambio-todos-os-boletins-diarios/resource/9d07b9dc-c2bc-47ca-af92-10b18bcd0d69

![API Banco Central](https://github.com/brunocesarti/code-bio/blob/main/documentacao/API%20banco%20central.png)

As moedas disponíveis:

![Moedas](https://github.com/brunocesarti/code-bio/blob/main/documentacao/Moedas%20PTAX.png)

É utilizado o fechamento PTAX na implementação da API: 

![Fechamento PTAX](https://github.com/brunocesarti/code-bio/blob/main/documentacao/PTAX%20Fechamento.png)



# Configurações realizadas no DEV
## Para utilizar o ambiente de desenvolvimento

No arquivo env, altere:
    
    CI_ENVIRONMENT = production para CI_ENVIRONMENT = development

Depois renomei o arquivo de env para .env, isso ativa o ambiente de desenvolvimento.

# Execução da API

## Configurações de banco de dados
    
    Necessário ter ambiente configurado para utilizar o banco de dados MySQL.
    Importar o banco de dados
    
## Clonar repositório
    
    Clone este repositório.
    
## Atualizar composer
 
    Na raiz do projeto, dê um "composer install" para atualiza-lo. Mais detalhes pode ser encontrado na documentação do framework.
    
## Start do projeto
    
    Na raiz do projeto, utilize o comando " php spark serve". Por padrão a primeira execução roda na porta 8080, se esta estiver ocupada, passa para a próxima, ficar atento a este detalhe.
    
## Endpoints implementados

saque: http://localhost:8080/saque
deposito: http://localhost:8080/deposito
saldo: http://localhost:8080/saldo
extrato: http://localhost:8080/extrato

É possível utilizar a ferramenta Postman ou outra de sua preferência, para testar os endpoints para os verbos da API, conforme se observa na lista de rotas.

# Pendências

Ainda esta pendente finalizar alguns ajustes no funcionamento dos endpoints e os testes utilizando o PHPUnit.

# CodeIgniter 4 Application Starter

## What is CodeIgniter?

CodeIgniter is a PHP full-stack web framework that is light, fast, flexible and secure.
More information can be found at the [official site](http://codeigniter.com).

This repository holds a composer-installable app starter.
It has been built from the
[development repository](https://github.com/codeigniter4/CodeIgniter4).

More information about the plans for version 4 can be found in [the announcement](http://forum.codeigniter.com/thread-62615.html) on the forums.

The user guide corresponding to this version of the framework can be found
[here](https://codeigniter4.github.io/userguide/).

## Installation & updates

`composer create-project codeigniter4/appstarter` then `composer update` whenever
there is a new release of the framework.

When updating, check the release notes to see if there are any changes you might need to apply
to your `app` folder. The affected files can be copied or merged from
`vendor/codeigniter4/framework/app`.

## Setup

Copy `env` to `.env` and tailor for your app, specifically the baseURL
and any database settings.

## Important Change with index.php

`index.php` is no longer in the root of the project! It has been moved inside the *public* folder,
for better security and separation of components.

This means that you should configure your web server to "point" to your project's *public* folder, and
not to the project root. A better practice would be to configure a virtual host to point there. A poor practice would be to point your web server to the project root and expect to enter *public/...*, as the rest of your logic and the
framework are exposed.

**Please** read the user guide for a better explanation of how CI4 works!

## Repository Management

We use Github issues, in our main repository, to track **BUGS** and to track approved **DEVELOPMENT** work packages.
We use our [forum](http://forum.codeigniter.com) to provide SUPPORT and to discuss
FEATURE REQUESTS.

This repository is a "distribution" one, built by our release preparation script.
Problems with it can be raised on our forum, or as issues in the main repository.

## Server Requirements

PHP version 7.3 or higher is required, with the following extensions installed:

- [intl](http://php.net/manual/en/intl.requirements.php)
- [libcurl](http://php.net/manual/en/curl.requirements.php) if you plan to use the HTTP\CURLRequest library

Additionally, make sure that the following extensions are enabled in your PHP:

- json (enabled by default - don't turn it off)
- [mbstring](http://php.net/manual/en/mbstring.installation.php)
- [mysqlnd](http://php.net/manual/en/mysqlnd.install.php)
- xml (enabled by default - don't turn it off)
