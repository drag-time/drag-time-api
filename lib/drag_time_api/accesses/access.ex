defmodule DragTimeApi.Accesses.Access do
  use Ecto.Schema
  import Ecto.Changeset

  schema "access" do
    field :access_code, :string

    timestamps()
  end

  @doc false
  def changeset(access, attrs) do
    access
    |> cast(attrs, [:access_code])
    |> validate_required([:access_code])
  end
end
