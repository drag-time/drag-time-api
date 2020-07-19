defmodule DragTimeApi.Repo.Migrations.CreateEventsArtists do
  use Ecto.Migration

  def change do
    create table(:events_artists) do
      add :event_id, references(:events)
      add :artist_id, references(:artists)
    end

    create unique_index(:events_artists, [:event_id, :artist_id])
  end
end
