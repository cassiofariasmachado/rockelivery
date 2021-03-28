defmodule Rockelivery.Users.DeleteTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Delete

  describe "call/1" do
    test "when user exists, deletes the user" do
      id = "9aad3e4f-9a5d-4cff-984e-8a4898632ff9"

      insert(:user, id: id)

      response =
        id
        |> Delete.call()

      assert {
               :ok,
               %User{
                 id: "9aad3e4f-9a5d-4cff-984e-8a4898632ff9",
                 name: "Cassio",
                 email: "cassio@email.com",
                 cpf: "12345678910",
                 address: "Rua das Bananeiras",
                 age: 24,
                 cep: "99999999"
               }
             } = response
    end

    test "when user not exists, ruturns an error" do
      id = "8b41de9e-6b97-47a2-8feb-f055332ca625"

      response =
        id
        |> Delete.call()

      assert {
               :error,
               %Error{
                 message: "User not found",
                 status: :not_found
               }
             } == response
    end
  end
end
