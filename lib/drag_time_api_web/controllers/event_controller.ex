defmodule DragTimeApiWeb.EventController do
  use DragTimeApiWeb, :controller

  alias DragTimeApi.Repo
  alias DragTimeApi.Events
  alias DragTimeApi.Events.Event

  action_fallback DragTimeApiWeb.FallbackController

  def index(conn, _params) do
    events = Repo.all(Event)
      |> Repo.preload(:artists)
      |> Repo.preload(:locations)

    render(conn, "index.json", events: events)
  end

  def create(conn, %{"event" => event_params}) do
    with {:ok, %Event{} = event} <- Events.create_event(event_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.event_path(conn, :show, event))
      |> render("create.json", event: event)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    |> Repo.preload(:artists)
    |> Repo.preload(:locations)
    render(conn, "show.json", event: event)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Events.get_event!(id)
    |> Repo.preload(:artists)
    |> Repo.preload(:locations)

    with {:ok, %Event{} = event} <- Events.update_event(event, event_params) do
      render(conn, "show.json", event: event)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Events.get_event!(id)
    |> Repo.preload(:artists)
    |> Repo.preload(:locations)

    with {:ok, %Event{}} <- Events.delete_event(event) do
      send_resp(conn, :no_content, "")
    end
  end
end
