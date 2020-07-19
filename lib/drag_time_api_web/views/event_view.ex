defmodule DragTimeApiWeb.EventView do
  use DragTimeApiWeb, :view
  alias DragTimeApiWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{type: "event",
      id: event.id,
      description: event.description,
      labels: event.labels,
      image: event.image,
      date: event.date,
      start_time: event.start_time,
      end_time: event.end_time,
      cost: event.cost,
      artists: render_one(DragTimeApi.Artists.get_artist!(1), DragTimeApiWeb.ArtistView, "artist.json"),
      #location: render_one(event.location_id, DragTimeApiWeb.LocationView, "location.json")}
      location: (if event.location_id, do: render_one(DragTimeApi.Locations.get_location!(event.location_id), DragTimeApiWeb.LocationView, "location.json"), else: event.location_id )}
  end

end
