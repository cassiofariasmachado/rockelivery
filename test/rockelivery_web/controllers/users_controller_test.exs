defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
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

    test "when there isn\'t a user with the given id, returns an error", %{conn: conn} do
      id = "31319c5f-2411-4e29-a9be-1475261d2949"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found"}

      assert expected_response == response
    end

    test "when the given id is not valid, returns an error", %{conn: conn} do
      id = "12345"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid id format"}

      assert expected_response == response
    end
  end

  describe "show/2" do
    test "when there is a user with the given id, returns the user", %{conn: conn} do
      id = "d96f3230-5a00-4d35-907f-cc0fce7739c0"

      insert(:user, id: id)

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:ok)

      expected_response = %{
        "user" => %{
          "id" => id,
          "name" => "Cassio",
          "email" => "cassio@email.com",
          "cpf" => "12345678910",
          "age" => 24,
          "cep" => "99999999",
          "address" => "Rua das Bananeiras"
        }
      }

      assert expected_response == response
    end

    test "when there isn\'t a user with the given id, returns an error", %{conn: conn} do
      id = "f82f1230-cac8-4797-9f63-b8ceda4bf6b9"

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found"}

      assert expected_response == response
    end

    test "when the given id is not valid, returns an error", %{conn: conn} do
      id = "12345"

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid id format"}

      assert expected_response == response
    end
  end

  describe "update/2" do
    test "when there is a user with the given id, updates the user", %{conn: conn} do
      id = "18ad3c36-3af6-47ed-9c02-0821af330673"

      insert(:user, id: id)

      params = %{
        "name" => "Cassio Machado"
      }

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, params))
        |> json_response(:ok)

      expected_response = %{
        "user" => %{
          "id" => id,
          "name" => "Cassio Machado",
          "email" => "cassio@email.com",
          "cpf" => "12345678910",
          "age" => 24,
          "address" => "Rua das Bananeiras",
          "cep" => "99999999"
        }
      }

      assert expected_response == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      id = "ec8a85c6-6c9e-4a04-927c-d6ede4a973dd"

      insert(:user, id: id)

      params = %{
        "name" => ""
      }

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      assert expected_response == response
    end

    test "when there isn\'t a user with the given id, returns an error", %{conn: conn} do
      id = "7dba804f-d669-488a-95a0-a9c067548ed2"

      response =
        conn
        |> put(Routes.users_path(conn, :update, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found"}

      assert expected_response == response
    end
  end
end
