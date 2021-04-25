defmodule Inmana.Restaurants.Get do
  alias Inmana.{Repo, Restaurant}

  def call(uuid) do
    '''
    Restaurant
    |> Repo.get(uuid)
    |> handle_insert()
    '''

    case Ecto.UUID.cast(uuid) do
      :error -> {:error, %{result: "Is invalid UUID", status: :bad_request}}
      {:ok, uuid} -> get(uuid)
    end
  end

  def get(uuid) do
    # Pattern Match
    # case => Swith Case
    case Repo.get(Restaurant, uuid) do
      nil -> {:error, %{result: "Restaurant not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  # defp handle_insert({%Restaurant{}} = result), do: {:ok, result}
  # defp handle_insert(nil), do: {:error, %{result: "Restaurant not found", status: :not_found}}
end
