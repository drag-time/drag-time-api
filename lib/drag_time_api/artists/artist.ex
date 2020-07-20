defmodule DragTimeApi.Artists.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :description, :string
    field :image, :string
    field :name, :string
    # many_to_many :events, Artist.Event, join_through: "events_artists"
    many_to_many(:events, DragTimeApi.Events.Event, join_through: DragTimeApi.EventsArtists)

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :image, :description])
    |> validate_required([:name, :image, :description])
  end
end
