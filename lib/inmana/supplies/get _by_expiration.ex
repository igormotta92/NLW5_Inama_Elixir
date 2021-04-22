defmodule Inmana.Supplies.GetByExpiration do
  import Ecto.Query

  alias Inmana.{Repo, Restaurant, Supply}

  # quando não há argumntos pode se passar apenas o nome da função
  def call do
    # week of monday at sunday
    today = Date.utc_today()
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    # supply pode ser qualquer nome
    # Ector.Query
    # ^ Pin Operator, serve para fixar um valor e não haver uma retribuição numa comparação
    # Obrigatório usar Pin Operator no Where do Ector.Query
    query =
      from supply in Supply,
        where:
          supply.expiration_date >= ^beginning_of_week and
            supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]

    # Modulo Emun: Tabalhar com Enumerabos, [listas[], Map${}]
    # Enum.map([1, 2, 3, 4, 5], fn x -> x * 2 end) => Função como cidadão de primeira classe (Função anônima)
    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end
