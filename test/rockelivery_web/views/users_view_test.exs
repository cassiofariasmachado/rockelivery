defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    token = "xpto1234"
    user = build(:user)

    response = render(UsersView, "create.json", user: user, token: token)

    assert %{
             message: "User created",
             access_token: ^token,
             user: %Rockelivery.User{
               id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
               name: "Cassio",
               email: "cassio@email.com",
               cpf: "12345678910",
               age: 24,
               cep: "99999999",
               address: "Rua das Bananeiras",
               inserted_at: nil,
               password: "12345678",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
