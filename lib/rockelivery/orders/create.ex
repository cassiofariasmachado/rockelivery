defmodule Rockelivery.Orders.Create do
  alias Rockelivery.{Error, Order, Repo}
  alias Rockelivery.Items.GetAllById, as: GetAllItemsById
  alias Rockelivery.Orders.ValidateAndMultiplyItems

  def call(%{"items" => items_params} = params) do
    items_ids = Enum.map(items_params, fn item -> item["id"] end)

    items_ids
    |> GetAllItemsById.call()
    |> ValidateAndMultiplyItems.call(items_ids, items_params)
    |> handle_items(params)
  end

  defp handle_items({:error, _reason} = error, _params), do: error

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Order{}} = result), do: result
  defp handle_insert({:error, reason}), do: {:error, Error.build(:bad_request, reason)}
end
