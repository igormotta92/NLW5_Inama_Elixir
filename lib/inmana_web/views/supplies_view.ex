defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  # supply está vindo na forma de "struct"
  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply created!",
      supply: supply
    }
  end

  # inline function
  def render("show.json", %{supply: supply}), do: %{supply: supply}
  def render("index.json", %{supply: supply}), do: %{suplies: supply}
end

'''
Jason.encode(%{a: 1, b: 2})
Jason.encode!((%{a: 1, b: 2}) #Retorna uma exceção casa não seja dado válido
'''
