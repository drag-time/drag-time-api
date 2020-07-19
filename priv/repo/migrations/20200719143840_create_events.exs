defmodule DragTimeApi.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :description, :string
      add :labels, :string
      add :image, :string
      add :date, :date
      add :start_time, :time
      add :end_time, :time
      add :cost, :float
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:location_id])
  end
end
