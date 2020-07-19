# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DragTimeApi.Repo.insert!(%DragTimeApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias DragTimeApi.Repo
alias DragTimeApi.Locations.Location

Repo.insert! %Location{
 name: "Tracks",
 address: "3500 Walnut St",
 city: "Denver",
 state: "CO",
 zip: "80205"
}

alias DragTimeApi.Repo
alias DragTimeApi.Events.Event

Repo.insert! %Event{
 title: "DRAG NATION",
 description: "Monsters and beauty queens unite for a one-of-a-kind drag experience. Along with Denver's hottest drag entertainers, we give you the glamour, filth, and horror that is the underground drag scene.",
 labels: ["21+", "Cover Charge", "Drag King"],
 image: "https://tracksdenver.com/wp-content/uploads/2019/06/02_28_DragNation3_Web.jpg",
 date: ~D[2020-02-29],
 start_time: ~T[22:00:00],
 end_time: ~T[23:59:59],
 cost: 10.00,
 location_id: 1
}
