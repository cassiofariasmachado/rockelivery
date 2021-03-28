defmodule Rockelivery.Users.UpdateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Update

  describe "call/1" do
    test "when user exists, updates the user" do
      insert(:user)

      params = %{
        "id" => "47d5430a-9569-40d7-9a33-222aaedb8e29",
        "name" => "Cassio Machado"
      }

      response =
        params
        |> Update.call()

      assert {
               :ok,
               %User{
                 id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
                 name: "Cassio Machado",
                 email: "cassio@email.com",
                 cpf: "12345678910",
                 age: 24,
                 cep: "99999999",
                 address: "Rua das Bananeiras"
               }
             } = response
    end

    test "when user not exists, returns an error" do
      params = %{
        "id" => "794fc956-7f79-44c2-b4b5-e8dcc536a365",
        "name" => "Cassio Machado"
      }

      response =
        params
        |> Update.call()

      assert {
               :error,
               %Error{
                 message: "User not found",
                 status: :not_found
               }
             } = response
    end
  end
end
