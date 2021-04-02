defmodule Rockelivery.ViaCep.Behaviour do
  alias Rockelivery.Error

  @typep cep_info_result :: {:ok, map()} | {:error, Error.t()}

  @callback get_cep_info(String.t()) :: cep_info_result
  @callback get_cep_info(String.t(), String.t()) :: cep_info_result
end
