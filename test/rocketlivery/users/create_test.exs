defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 24, name: "Cassio"}} = response
    end

    test "when all invalid params, returns an error" do
      params = build(:user_params, %{age: 10, password: "1234"})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{message: changeset, status: :bad_request}} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
