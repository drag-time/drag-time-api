defmodule DragTimeApi.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :cost, :float
    field :date, :date
    field :description, :string
    field :end_time, :time
    field :image, :string
    field :labels, {:array, :string}
    field :start_time, :time
    belongs_to :locations, DragTimeApi.Locations.Location, foreign_key: :location_id
    many_to_many(:artists, DragTimeApi.Artists.Artist, join_through: DragTimeApi.EventsArtists)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :labels, :image, :date, :start_time, :end_time, :cost, :location_id])
    |> validate_required([:title, :description, :labels, :image, :date, :start_time, :end_time, :cost, :location_id])
    |> unique_constraint(:id)
  end
end
