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
    field :location_id, :id
    # has_one :locations, Events.Location
    # has_many :artists, Events.Artist
    many_to_many :artists, Event.Artist, join_through: "events_artists"

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :labels, :image, :date, :start_time, :end_time, :cost])
    |> validate_required([:title, :description, :labels, :image, :date, :start_time, :end_time, :cost])
  end
end
