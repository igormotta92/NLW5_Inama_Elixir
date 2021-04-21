defmodule InmanaWeb.RestaurantsController do
  # Defini que é um controller
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  # alias Inmana.Restaurants.Create
  # alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.FallbackController

  # Tratamento de exceções
  action_fallback FallbackController

  # Create.call(params) retonar exceção quando erro
  def create(conn, params) do
    # with {:ok, %Restaurant{} = restaurant} <- Create.call(params) do #Usando alias
    # with {:ok, %Restaurant{} = restaurant} <- RestaurantCreate.call(params) do #Usando apelido
    # Usando Facade :lib\inmana.ex
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      # redenrizar uma view
      # create.json msm nome existente no modulo de view
      |> render("create.json", restaurant: restaurant)
    end
  end
end

'''
#Key word argument
 # - Chave: valor

#Match Case

with
  {} <- Modulo.funcao(),
  {} <- Modulo.funcao(),
  {} <- Modulo.funcao(),
  {} <- Modulo.funcao() do

  else
    caso -> resposta
    caso2 -> resposta2
    caso3 -> resposta3
end
'''
