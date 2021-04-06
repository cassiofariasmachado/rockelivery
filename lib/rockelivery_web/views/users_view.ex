defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("sign_in.json", %{token: token}), do: %{access_token: token}

  def render("create.json", %{user: %User{} = user, token: token}) do
    %{
      message: "User created",
      user: user,
      access_token: token
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
