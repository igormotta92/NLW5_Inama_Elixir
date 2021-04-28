<h1 align="center">
    <img alt="Be the Hero" src="inmana_logo_sem_fundo.png" width="250px" />
</h1>

<h4 align="center">
  🚀 Semana NLW5 (Next Level Week 5)
</h4>

<p align="center">

  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/igormotta92/NLW5_Inama_Elixir.svg">

  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/igormotta92/NLW5_Inama_Elixir">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/igormotta92/NLW5_Inama_Elixir">

  <a href="https://github.com/igormotta92/NLW5_Inama_Elixir/commits/master">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/igormotta92/NLW5_Inama_Elixir">
  </a>

  <a href="https://github.com/igormotta92/NLW5_Inama_Elixir/issues">
    <img alt="Repository issues" src="https://img.shields.io/github/issues/igormotta92/NLW5_Inama_Elixir">
  </a>
</p>

<p align="center">
  <a href="#rocket-tecnologias-usadas"> :rocket: Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#octocat-sobre-projeto">:octocat: Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#thinking-como-contribuir">:thinking: Como Contribuir</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#bookmark-como-executar">:bookmark: Como Executar</a>&nbsp;&nbsp;&nbsp;
</p>

<br>

## :octocat: Sobre Projeto

Inmana é uma pequena aplicação criada na semana NLW5(Next Level Week 5) da Rocketseat usando Elixir e Phoenix framework.

Aplicação foi criada para ajudar restaurantes mandando um aviso, por e-mail, para o responsável de cada restaurante com a lista de suprimentos à vencer por semana.

## :rocket: Tecnologias Usadas
Esse projeto foi desenvolvido com as seguintes tecnologias:

> - [Elixir](https://elixir-lang.org/)
> - [PostgreSQL](https://www.postgresql.org/)
> - [Phoenix Framework][PhoenixFramework]
> - [Bamboo][Bamboo]
> - [VS Code](https://code.visualstudio.com/)

## :thinking: Como contribuir

- Faça um fork desse repositório;
- Cria uma branch com a sua feature: `git checkout -b minha-feature`;
- Faça commit das suas alterações: `git commit -m 'feat: Minha nova feature'`;
- Faça push para a sua branch: `git push origin minha-feature`.

Depois que o merge da sua pull request for feito, você pode apagar a sua branch.

## Configuração de Ambiente (NLW5)
[Copiá da configuração do ambiente (by Rocketseat)](https://www.notion.so/Copy-of-Configura-es-do-ambiente-by-Rocketseat-c875e302f22c49b0a82d06ce33ff957c)

## :bookmark: Como Executar

Clonar e iniciar aplicação, você precisará ter Git, Elixir v1.7 ou superior instalado em seu computador e o [Inmana](https://github.com/igormotta92/NLW5_Inama_Elixir.git).

Em seu terminal

```bash
# Clonando repositório
$ git clone https://github.com/igormotta92/NLW5_Inama_Elixir.git

# Acessando projeto
$ cd inmana

# Instalando dependências do Elixir API
$ mix deps.get

#Se tiver o postgresql instalado corretamente
#Crie o banco e execute as migrations
$ mix ecto.setup

#Execute e user a rota Ex.: (http://localhost:4000/)
$ mix phx.server
```
[PhoenixFramework]: https://www.phoenixframework.org/
[Bamboo]: https://github.com/thoughtbot/bamboo
