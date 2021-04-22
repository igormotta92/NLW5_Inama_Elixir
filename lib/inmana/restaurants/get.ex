defmodule Inmana.Restaurants.Get do
  alias Inmana.{Repo, Restaurant}

  def call(uuid) do
    '''
    Restaurant
    |> Repo.get(uuid)
    |> handle_insert()
    '''

    # Pattern Match
    # case => Swith Case
    case Repo.get(Restaurant, uuid) do
      nil -> {:error, %{result: "Restaurant not found", status: :not_found}}
      restaurant -> {:ok, restaurant}
    end
  end

  # defp handle_insert({%Restaurant{}} = result), do: {:ok, result}
  # defp handle_insert(nil), do: {:error, %{result: "Restaurant not found", status: :not_found}}
end
