defmodule DragTimeApiWeb.EventView do
  use DragTimeApiWeb, :view
  alias DragTimeApiWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("create.json", %{event: event}) do
    %{type: "event",
      id: event.id,
      title: event.title,
      description: event.description,
      labels: event.labels,
      image: event.image,
      date: event.date,
      start_time: event.start_time,
      end_time: event.end_time,
      cost: event.cost,
      location_id: event.location_id}
  end

  def render("event.json", %{event: event}) do
    %{type: "event",
      id: event.id,
      title: event.title,
      description: event.description,
      labels: event.labels,
      image: event.image,
      date: event.date,
      start_time: event.start_time,
      end_time: event.end_time,
      cost: event.cost,
      artists: render_many(event.artists, DragTimeApiWeb.ArtistView, "artist.json"),
      location: render_one(event.locations, DragTimeApiWeb.LocationView, "location.json")}
  end

end
