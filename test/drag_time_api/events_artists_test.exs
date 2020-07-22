# defmodule DragTimeApi.ArtistsTest do
#   use DragTimeApi.DataCase
#
#   # alias DragTimeApi.EventsArtists
#
#   describe "events_artists" do
#     # alias DragTimeApi.EventsArtists.EventsArtists
#
#     @valid_artist_attrs %{description: "some description", image: "some image", name: "some name"}
#     @update_artist_attrs %{description: "some updated description", image: "some updated image", name: "some updated name"}
#     @invalid_artist_attrs %{description: nil, image: nil, name: nil}
#
#     @valid_event_attrs %{title: "some title", cost: 120.5, date: ~D[2010-04-17], description: "some description", end_time: ~T[14:00:00], image: "some image", labels: ["21+", "Cover Charge", "Drag King"], start_time: ~T[14:00:00]}
#     @update_event_attrs %{title: "some title 2", cost: 456.7, date: ~D[2011-05-18], description: "some updated description", end_time: ~T[15:01:01], image: "some updated image", labels: ["18+", "Cover Charge", "Drag King"], start_time: ~T[15:01:01]}
#     @invalid_event_attrs %{title: nil, cost: nil, date: nil, description: nil, end_time: nil, image: nil, labels: nil, start_time: nil}
# 
#     def artist_fixture(attrs \\ %{}) do
#       {:ok, artist} =
#         attrs
#         |> Enum.into(@valid_artist_attrs)
#         |> Artists.create_artist()
#
#       artist
#     end
#
#     def event_fixture(attrs \\ %{}) do
#       {:ok, event} =
#         attrs
#         |> Enum.into(@valid_event_attrs)
#         |> Events.create_event()
#
#       event
#     end
#
#     test "Associating artist and event goes through joins table" do
#       artist = artist_fixture()
#       event = event_fixture()
#       events_artists = %{event.id, artist.id}
