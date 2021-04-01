defmodule Rockelivery.Items.GetAllById do
  import Ecto.Query

  alias Rockelivery.{Item, Repo}

  def call([]), do: {:error, "Deve ser informado ao menos um id de item"}

  def call(ids) do
    query = from item in Item, where: item.id in ^ids

    Repo.all(query)
  end
end
