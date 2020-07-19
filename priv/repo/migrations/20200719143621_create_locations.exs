defmodule DragTimeApi.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :address, :string

      timestamps()
    end

  end
end
