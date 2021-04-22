defmodule InmanaWeb.SuppliesController do
  # Defini que é um controller
  use InmanaWeb, :controller

  # alias Inmana.Supplies.Create
  # alias Inmana.Supplies.Create, as: RestaurantCreate
  alias Inmana.Supply
  alias Inmana.FallbackController

  # Tratamento de exceções
  action_fallback FallbackController

  # Create.call(params) retonar exceção quando erro
  def create(conn, params) do
    # with {:ok, %Supply{} = supply} <- Create.call(params) do #Usando alias
    # with {:ok, %Supply{} = supply} <- RestaurantCreate.call(params) do #Usando apelido
    # Usando Facade :lib\inmana.ex
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      # redenrizar uma view
      # create.json msm nome existente no modulo de view
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end

  def index(conn, _params) do
    with {:ok, supply} <- Inmana.index_supply() do
      conn
      |> put_status(:ok)
      |> render("index.json", supply: supply)
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
