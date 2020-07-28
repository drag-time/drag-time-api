defmodule DragTimeApi.EventsTest do
  use DragTimeApi.DataCase

  alias DragTimeApi.Events
  alias DragTimeApi.Repo
  alias DragTimeApi.Locations.Location
  alias DragTimeApi.Locations

  describe "events" do
    alias DragTimeApi.Events.Event

    @location_attrs %{ address: "some address", name: "some name", city: "some city", state: "some state", zip: "some zip"}
    @valid_attrs %{title: "some title", cost: 120.5, date: ~D[2010-04-17], description: "some description", end_time: ~T[14:00:00], image: "some image", labels: ["21+", "Cover Charge", "Drag King"], start_time: ~T[14:00:00]}
    @update_attrs %{title: "some title 2", cost: 456.7, date: ~D[2011-05-18], description: "some updated description", end_time: ~T[15:01:01], image: "some updated image", labels: ["18+", "Cover Charge", "Drag King"], start_time: ~T[15:01:01]}
    @invalid_attrs %{title: nil, cost: nil, date: nil, description: nil, end_time: nil, image: nil, labels: nil, location_id: nil, start_time: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@location_attrs)
        |> Locations.create_location()

      location
    end

    def event_fixture(attrs \\ %{}) do
      location = location_fixture(@location_attrs)
      {:ok, event} =
        attrs
        |> Map.put(:location_id, location.id)
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      location = location_fixture(@location_attrs)
      attrs = Map.put(@valid_attrs, :location_id, location.id)

      assert {:ok, %Event{} = event} = Events.create_event(attrs)
      assert event.title == "some title"
      assert event.cost == 120.5
      assert event.date == ~D[2010-04-17]
      assert event.description == "some description"
      assert event.end_time == ~T[14:00:00]
      assert event.image == "some image"
      assert event.labels == ["21+", "Cover Charge", "Drag King"]
      assert event.start_time == ~T[14:00:00]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      location = location_fixture(@location_attrs)
      attrs = Map.put(@update_attrs, :location_id, location.id)

      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, attrs)
      assert event.title == "some title 2"
      assert event.cost == 456.7
      assert event.date == ~D[2011-05-18]
      assert event.description == "some updated description"
      assert event.end_time == ~T[15:01:01]
      assert event.image == "some updated image"
      assert event.labels == ["18+", "Cover Charge", "Drag King"]
      assert event.start_time == ~T[15:01:01]
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
