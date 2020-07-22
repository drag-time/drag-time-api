defmodule DragTimeApiWeb.LocationView do
  use DragTimeApiWeb, :view
  alias DragTimeApiWeb.LocationView

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      name: location.name,
      address: location.address,
      city: location.city,
      state: location.state,
      zip: location.zip}
  end
end
