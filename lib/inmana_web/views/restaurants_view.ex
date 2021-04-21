defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  # restaurant está vindo no forma de "struct"
  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end

'''
Jason.encode(%{a: 1, b: 2})
Jason.encode!((%{a: 1, b: 2}) #Retorna uma exceção casa não seja dado válido
'''
