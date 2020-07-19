defmodule DragTimeApi.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :cost, :float
    field :date, :date
    field :description, :string
    field :end_time, :time
    field :image, :string
    field :labels, :string
    field :start_time, :time
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:description, :labels, :image, :date, :start_time, :end_time, :cost])
    |> validate_required([:description, :labels, :image, :date, :start_time, :end_time, :cost])
  end
end
