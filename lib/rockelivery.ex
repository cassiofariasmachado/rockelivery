defmodule Rockelivery do
  @moduledoc """
  Rockelivery keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Rockelivery.Users.Create, as: CreateUser
  alias Rockelivery.Users.Delete, as: DeleteUser
  alias Rockelivery.Users.Get, as: GetUser
  alias Rockelivery.Users.Update, as: UpdateUser

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate delete_user(id), to: DeleteUser, as: :call
  defdelegate update_user(params), to: UpdateUser, as: :call
  defdelegate get_user_by_id(id), to: GetUser, as: :by_id
end
