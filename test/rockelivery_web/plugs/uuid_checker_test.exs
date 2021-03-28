defmodule RockeliveryWeb.Plugs.UUIDCheckerTest do
  use RockeliveryWeb.ConnCase, async: true

  alias RockeliveryWeb.Plugs.UUIDChecker

  describe "init/1" do
    test "returns the options" do
      options = %{
        test: "teste"
      }

      response = UUIDChecker.init(options)

      assert options == response
    end
  end

  describe "call/2" do
    test "when the id is valid, returns the connection", %{conn: conn} do
      options = %{}

      conn_with_params = %{conn | params: %{"id" => "9bb24657-6b40-45aa-8e65-f4ebe675e186"}}

      response =
        conn_with_params
        |> UUIDChecker.call(options)

      assert conn_with_params == response
    end

    test "when there is no id, returns the connection", %{conn: conn} do
      options = %{}

      response =
        conn
        |> UUIDChecker.call(options)

      assert conn == response
    end

    test "when the is invalid, returns an error", %{conn: conn} do
      options = %{}

      response =
        %{conn | params: %{"id" => "12345"}}
        |> UUIDChecker.call(options)

      expected_response = %{"message" => "Invalid id format"}

      assert expected_response == json_response(response, :bad_request)
    end
  end
end
