defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = message), do: message

  defp handle_insert({:error, message}) do
    {:error, Error.build(:bad_request, message)}
  end
end
