defmodule DragTimeApiWeb.EventControllerTest do
  use DragTimeApiWeb.ConnCase

  alias DragTimeApi.Events
  alias DragTimeApi.Events.Event
  alias DragTimeApi.Locations.Location
  alias DragTimeApi.Locations

  @location_attrs %{ address: "some address", name: "some name", city: "some city", state: "some state", zip: "some zip"}

  @create_attrs %{
    title: "some title",
    cost: 120.5,
    date: ~D[2010-04-17],
    description: "some description",
    end_time: ~T[14:00:00],
    image: "some image",
    labels: ["some labels"],
    start_time: ~T[14:00:00]
  }
  @update_attrs %{
    title: "some title 2",
    cost: 456.7,
    date: ~D[2011-05-18],
    description: "some updated description",
    end_time: ~T[15:01:01],
    image: "some updated image",
    labels: ["some updated labels"],
    start_time: ~T[15:01:01]
    }
  @invalid_attrs %{cost: nil, date: nil, description: nil, end_time: nil, image: nil, labels: nil, start_time: nil}

  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(@location_attrs)
      |> Locations.create_location()

    location
  end

  def fixture(:event) do
    location = location_fixture(@location_attrs)
    attrs = Map.put(@create_attrs, :location_id, location.id)

    {:ok, event} = Events.create_event(attrs)
    event
  end

  def event_fixture(attrs \\ %{}) do
    location = location_fixture(@location_attrs)
    {:ok, event} =
      attrs
      |> Map.put(:location_id, location.id)
      |> Enum.into(@create_attrs)
      |> Events.create_event()

    event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      location = location_fixture(@location_attrs)
      attrs = Map.put(@create_attrs, :location_id, location.id)

      conn = post(conn, Routes.event_path(conn, :create), event: attrs)
      id = json_response(conn, 201)["id"]

      conn = get(conn, Routes.event_path(conn, :show, id))

      assert %{
               "id" => id,
               "cost" => 120.5,
               "date" => "2010-04-17",
               "description" => "some description",
               "end_time" => "14:00:00",
               "image" => "some image",
               "labels" => ["some labels"],
               "start_time" => "14:00:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update event" do
    setup [:create_event]

    test "renders event when data is valid", %{conn: conn, event: %Event{id: id} = event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.event_path(conn, :show, id))

      assert %{
               "id" => id,
               "cost" => 456.7,
               "date" => "2011-05-18",
               "description" => "some updated description",
               "end_time" => "15:01:01",
               "image" => "some updated image",
               "labels" => ["some updated labels"],
               "start_time" => "15:01:01"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, Routes.event_path(conn, :delete, event))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.event_path(conn, :show, event))
      end
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    %{event: event}
  end
end
