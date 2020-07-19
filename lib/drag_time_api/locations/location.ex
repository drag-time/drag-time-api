defmodule DragTimeApi.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :address, :string
    field :name, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    has_many :events, DragTimeApi.Events.Event

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :address, :city, :state, :zip])
    |> validate_required([:name, :address, :city, :state, :zip])
  end
end
