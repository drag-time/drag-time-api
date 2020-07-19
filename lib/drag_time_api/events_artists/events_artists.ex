defmodule DragTimeApi.EventsArtists do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "events_artists" do
    belongs_to :event, DragTimeApi.Events.Event
    belongs_to :artist, DragTimeApi.Artists.Artist
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:event_id, :artist_id])
    |> validate_required([:event_id, :artist_id])
  end

end
