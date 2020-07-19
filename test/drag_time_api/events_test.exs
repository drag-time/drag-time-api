defmodule DragTimeApi.EventsTest do
  use DragTimeApi.DataCase

  alias DragTimeApi.Events

  describe "events" do
    alias DragTimeApi.Events.Event

    @valid_attrs %{cost: 120.5, date: ~D[2010-04-17], description: "some description", end_time: ~T[14:00:00], image: "some image", labels: "some labels", start_time: ~T[14:00:00]}
    @update_attrs %{cost: 456.7, date: ~D[2011-05-18], description: "some updated description", end_time: ~T[15:01:01], image: "some updated image", labels: "some updated labels", start_time: ~T[15:01:01]}
    @invalid_attrs %{cost: nil, date: nil, description: nil, end_time: nil, image: nil, labels: nil, start_time: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
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
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.cost == 120.5
      assert event.date == ~D[2010-04-17]
      assert event.description == "some description"
      assert event.end_time == ~T[14:00:00]
      assert event.image == "some image"
      assert event.labels == "some labels"
      assert event.start_time == ~T[14:00:00]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.cost == 456.7
      assert event.date == ~D[2011-05-18]
      assert event.description == "some updated description"
      assert event.end_time == ~T[15:01:01]
      assert event.image == "some updated image"
      assert event.labels == "some updated labels"
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