defmodule Inmana.Restaurants.Index do
  alias Inmana.{Repo, Restaurant}

  def call() do
    '''
    Restaurant
    |> Repo.get(uuid)
    |> handle_insert()
    '''

    # Pattern Match
    # case => Swith Case
    case Repo.all(Restaurant) do
      # nil -> {:error, %{result: "Restaurant empty", status: :ok}}
      nil -> {:error, %{result: "Restaurant empty", status: :not_found}}
      restaurant -> {:ok, restaurant}
    end
  end

  # defp handle_insert({%Restaurant{}} = result), do: {:ok, result}
  # defp handle_insert(nil), do: {:error, %{result: "Restaurant not found", status: :not_found}}
end
