defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "name" => "Cassio",
      "email" => "cassio@email.com",
      "cpf" => "12345678910",
      "age" => 24,
      "address" => "Rua das Bananeiras",
      "cep" => "99999999",
      "password" => "12345678"
    }
  end

  def user_factory do
    %User{
      id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
      name: "Cassio",
      email: "cassio@email.com",
      cpf: "12345678910",
      age: 24,
      address: "Rua das Bananeiras",
      cep: "99999999",
      password: "12345678"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
