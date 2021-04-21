defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  
  @required_params [:email, :name]
  
  #Faz a geração de uma struct em forma de json, redenrisa os valores em json
  @derive {Jason.Encoder, only: @required_params ++ [:id]} #required_params ++ [:id] adicionar id a lista

  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  # Conjunto de mudanças (Faz cast de dados e validações)
  # __MODULE__ => Inmana.Restaurant
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params) #[:email, :name]
    |> validate_required(@required_params) #[:email, :name]
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/) # Sigio ~r/<regex>/ => Criação de regex
    |> unique_constraint([:email])
  end
end
