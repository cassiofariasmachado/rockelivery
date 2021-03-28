defmodule Rockelivery.Users.GetTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Get

  describe "by_id/1" do
    test "when user exists, returns the user" do
      id = "7bd9a991-014b-47e5-a06c-8bd01bee9999"

      insert(:user, id: id)

      response =
        id
        |> Get.by_id()

      assert {:ok,
              %User{
                id: "7bd9a991-014b-47e5-a06c-8bd01bee9999",
                name: "Cassio",
                email: "cassio@email.com",
                cpf: "12345678910",
                age: 24,
                cep: "99999999",
                address: "Rua das Bananeiras"
              }} = response
    end

    test "when the user not exits, returns an error" do
      id = "7bd9a991-014b-47e5-a06c-8bd01bee9999"

      response =
        id
        |> Get.by_id()

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
