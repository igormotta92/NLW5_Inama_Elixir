# defmodule Projeto.Arquivo do
defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:email, :name]

  # Faz a geração de uma struct em forma de json, redenrisa os valores em json
  # required_params ++ [:id] adicionar id a lista
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    # Um restaurante tem vários suprimentos
    has_many :supplies, Supply

    timestamps()
  end

  # Conjunto de mudanças (Faz cast de dados e validações)
  # __MODULE__ => Inmana.Restaurant
  def changeset(params) do
    %__MODULE__{}
    # [:email, :name]
    |> cast(params, @required_params)
    # [:email, :name]
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    # Sigio ~r/<regex>/ => Criação de regex
    # |> validate_format(:email, ~r/@/)
    |> validate_format(:email, ~r/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    |> unique_constraint([:email])
  end
end
