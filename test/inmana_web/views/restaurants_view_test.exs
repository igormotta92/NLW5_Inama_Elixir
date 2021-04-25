# O Fluxo de execução de teste não percorre o mesmo fluxo do sistema
defmodule InmanaWeb.RestaurantsViewTest do
  # É possive rodas todos os teste em pararelo. Adicionando o use async: true
  # Bom para sistemas com muitos testes
  # Essa mecânica é recomendavel apenas caso do database seja Postgre
  # Não usar com outros bancos
  # use InmanaWeb.ConnCase, async: true
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "siri@cascudo.com",
                 id: _id,
                 name: "Siri cascudo"
               }
             } = response
    end
  end
end
