defmodule Rockelivery.Users.Create do
  import Rockelivery.ViaCep.Client, only: [get_client: 0]

  alias Rockelivery.{Error, Repo, User}

  def call(params) do
    cep = Map.get(params, "cep")
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- get_client().get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, reason} -> {:error, Error.build_bad_request(reason)}
    end
  end
end
