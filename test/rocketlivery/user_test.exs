defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.User
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when the create params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Cassio",
                 email: "cassio@email.com",
                 cpf: "12345678910",
                 age: 24,
                 address: "Rua das Bananeiras",
                 cep: "99999999",
                 password: "12345678"
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{age: 10, password: "123"}

      response = User.changeset(params)

      expected_response = %{
        address: ["can't be blank"],
        age: ["must be greater than or equal to 18"],
        cep: ["can't be blank"],
        cpf: ["can't be blank"],
        email: ["can't be blank"],
        name: ["can't be blank"],
        password: ["should be at least 6 character(s)"]
      }

      assert expected_response == errors_on(response)
    end
  end

  describe "changeset/2" do
    setup %{} do
      params = build(:user_params)

      changeset = User.changeset(params)

      {:ok, changeset: changeset}
    end

    test "when the update params are valid, returns a valid changeset", %{changeset: changeset} do
      params = %{name: "Cassio Machado", age: 25}

      response =
        changeset
        |> User.changeset(params)

      assert %Changeset{
               changes: %{
                 name: "Cassio Machado",
                 email: "cassio@email.com",
                 cpf: "12345678910",
                 age: 25,
                 address: "Rua das Bananeiras",
                 cep: "99999999",
                 password: "12345678"
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset", %{changeset: changeset} do
      params = %{age: 10, password: "123"}

      response =
        changeset
        |> User.changeset(params)

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert expected_response == errors_on(response)
    end
  end
end
