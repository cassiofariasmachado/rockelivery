defmodule Rockelivery.Items.Create do
  alias Rockelivery.{Error, Item, Repo}

  def call(params) do
    params
    |> Item.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Item{}} = message), do: message

  defp handle_insert({:error, message}), do: {:error, Error.build_bad_request(message)}
end
