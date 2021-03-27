defmodule Rockelivery.Error do
  @keys [:status, :message]

  @enforce_keys @keys

  defstruct @keys

  def build(status, message) do
    %__MODULE__{
      status: status,
      message: message
    }
  end

  def build_user_not_found, do: build(:not_found, "User not found")
end
