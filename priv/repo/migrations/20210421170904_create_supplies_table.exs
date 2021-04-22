defmodule Inmana.Repo.Migrations.CreateSuppliesTable do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :description, :string
      add :expiration_date, :date
      add :responsible, :string
      # Caso use se use o ID não precisa definir o "type"
      add :restaurant_id, references(:restaurants, type: :binary_id)

      timestamps()
    end
  end
end
