defmodule RockeliveryWeb.WelcomeControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  describe "index/2" do
    test "returns welcome message", %{conn: conn} do
      response =
        conn
        |> get(Routes.welcome_path(conn, :index))
        |> json_response(:ok)

      expected_response = %{"message" => "Welcome :)"}

      assert expected_response == response
    end
  end
end
