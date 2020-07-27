defmodule DragTimeApi.Repo.Migrations.CreateAccess do
  use Ecto.Migration

  def change do
    create table(:access) do
      add :access_code, :string

      timestamps()
    end

  end
end
