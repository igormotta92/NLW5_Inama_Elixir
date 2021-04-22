defmodule Inmana.Supplies.Index do
  alias Inmana.{Repo, Supply}

  def call() do
    '''
    Supply
    |> Repo.get(uuid)
    |> handle_insert()
    '''

    # Pattern Match
    # case => Swith Case
    case Repo.all(Supply) do
      # nil -> {:error, %{result: "Supply empty", status: :ok}}
      nil -> {:error, %{result: "Supply empty", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  # defp handle_insert({%Supply{}} = result), do: {:ok, result}
  # defp handle_insert(nil), do: {:error, %{result: "Supply not found", status: :not_found}}
end
