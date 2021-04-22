defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # design pattern facade (Ter um ponto centralizado nos modulos)
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Restaurants.Get, as: RestaurantGet
  alias Inmana.Restaurants.Index, as: RestaurantIndex

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate get_restaurant(params), to: RestaurantGet, as: :call
  defdelegate index_restaurant(), to: RestaurantIndex, as: :call

  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Get, as: SupplyGet
  alias Inmana.Supplies.Index, as: SupplyIndex

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
  defdelegate index_supply(), to: SupplyIndex, as: :call
end
