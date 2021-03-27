defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/1" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_web_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua das Bananeiras",
                 "age" => 24,
                 "cep" => "99999999",
                 "cpf" => "12345678910",
                 "email" => "cassio@email.com",
                 "id" => _id,
                 "name" => "Cassio"
               }
             } = response
    end

    test "when there are invalid params, returns the errors", %{conn: conn} do
      params = %{}

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "name" => ["can't be blank"],
          "password" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "47d5430a-9569-40d7-9a33-222aaedb8e29"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert "" == response
    end
  end
end
