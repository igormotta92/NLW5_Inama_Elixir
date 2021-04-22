# defmodule Projeto.Arquivo do
defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  # Faz a geração de uma struct em forma de json, redenrisa os valores em json
  # required_params ++ [:id] adicionar id a lista
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    # Formato Date defult Elix é YYYY-MM-DD
    field :expiration_date, :date
    field :responsible, :string

    # Um suprimento pertence a um restaurante
    belongs_to :restaurant, Restaurant

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
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end
end
