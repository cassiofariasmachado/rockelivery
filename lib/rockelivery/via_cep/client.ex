defmodule Rockelivery.ViaCep.Client do
  use Tesla

  alias Rockelivery.Error
  alias Tesla.Env

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"

  def get_cep_info(cep) do
    "#{cep}/json"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}) do
    {:error, Error.build_not_found("CEP not found")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_get({:ok, %Env{status: 400, body: _body}}) do
    {:error, Error.build_bad_request("Invalid CEP")}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build_bad_request(reason)}
  end
end