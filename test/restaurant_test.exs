# Teste de Changeset
defmodule Inmana.RestaurantTest do
  use Inmana.DataCase
  # Usado para testar ações no banco de dados e changeset. Traz funcionalidades
  # a mais. Salva as coisas no ambiente de teste e executa rollback após a
  # execução.

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are vlid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      # assert response == "banana"
      assert %Changeset{
               changes: %{
                 email: "siri@cascudo.com",
                 name: "Siri cascudo"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "S", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      # assert response == "banana"
      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
