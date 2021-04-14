# Rockelivery

[![Language](https://img.shields.io/badge/language-elixir-purple)](https://img.shields.io/badge/language-elixir-purple) [![Platform](https://img.shields.io/badge/platform-api-blueviolet)](https://img.shields.io/badge/platform-api-blueviolet) [![License](https://img.shields.io/badge/license-MIT-lightgrey)](/LICENSE) [![CI](https://github.com/cassiofariasmachado/rockelivery/actions/workflows/ci.yml/badge.svg)](https://github.com/cassiofariasmachado/rockelivery/actions/workflows/ci.yml) [![codecov](https://codecov.io/gh/cassiofariasmachado/rockelivery/branch/main/graph/badge.svg?token=N7AWX8EHV5)](https://codecov.io/gh/cassiofariasmachado/rockelivery)

Repository for my Rockelivery project of the Elixir's path from [Rocketseat Ignite](https://rocketseat.com.br).

## :rocket: Techs

* [Elixir](https://elixir-lang.org/)
* [Phoenix](https://www.phoenixframework.org/)
* [Ecto](https://hexdocs.pm/ecto/Ecto.html)

## :wrench: Setup

  * Install dependencies with `mix deps.get`
  * For interactive testing use `iex -S mix`
  * For create database use `mix ecto.create`
  * For migrate database use `mix ecto.migrate`
  * For start phoenix server use `mix phx.server`

## :white_check_mark: Test

To run tests:

* Run with `mix test --cover`
* Run with `mix coveralls.html` to generate HTML report

## :rocket: Deploy

For manually deploy:

* Install [Gigalixir CLI](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html#install-the-command-line-interface)

* Set `APP_NAME` variable

```powershell
$env:APP_NAME=rockelivery
```

* Configure git remote

```powershell
gigalixir git:remote $APP_NAME
```

* Publish changes

```powershell
git push gigalixir
```

## :whale: Docker and compose

For run app with Docker compose locally:

* Set required env variables

```powershell
$env:SECRET_KEY_BASE="$(mix phx.gen.secret)"
$env:DATABASE_URL="postgresql://postgres:postgres@db:5432/rockelivery"
```

> _SECRET_KEY_BASE_ should be defined at build time and at runtime for app works correctly, so it's used by _Dockerfile_ as a _build-arg_ and by _docker-compose_ as an environment variable

* Run build

```powershell
docker-compose build --build-arg DB_URL="$env:DATABASE_URL" --build-arg SECRET="$env:SECRET_KEY_BASE"
```

* Run services

```powershell
docker-compose up
```

* Create and migrate database

```powershell
mix ecto.create
mix ecto.migrate
```

> Only works cause postgres service is running locally and with the default port exposed to machine

## :page_facing_up: License

* [MIT](/LICENSE.txt)
