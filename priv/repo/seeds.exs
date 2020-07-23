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

Repo.insert! %Location{
 name: "Charlie's Nightclub Denver",
 address: "900 E Colfax Ave",
 city: "Denver",
 state: "CO",
 zip: "80218"
}

Repo.insert! %Location{
 name: "Hamburger Mary's Denver",
 address: "1336 E 17th Ave",
 city: "Denver",
 state: "CO",
 zip: "80218"
}

Repo.insert! %Location{
 name: "Cheer Up Charlies",
 address: "900 Red River St",
 city: "Austin",
 state: "TX",
 zip: "78701"
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

Repo.insert! %Event{
 title: "Neon Rainbows 90’s Country Night: Dolly Would with DJ Boi Orbison & The Gay Ole Opry Drag Show",
 description: "Monsters and beauty queens unite for a one-of-a-kind drag experience. Along with Denver's hottest drag entertainers, we give you the glamour, filth, and horror that is the underground drag scene.",
 labels: ["Musical", "Tribute"],
 image: "http://cheerupcharlies.com/wp-content/uploads/2020/01/82851571_3017189774995177_6442076964017668096_n.jpg",
 date: ~D[2020-07-31],
 start_time: ~T[20:00:00],
 end_time: ~T[23:00:00],
 cost: 0.00,
 location_id: 5
}

Repo.insert! %Event{
 title: "Legendary-O-Ke & Snatched",
 description: "Come Sing your life out with Karaoke in the lounge and if that's not for you, Enjoy an amazing show on the main floor. $3.00 Long Islands and AMF's.",
 labels: ["21+", "Cover Charge"],
 image: "https://www.charliesdenver.com/shared/userfiles/eventImages/f093d548a87e50db03f07be1a85c66211583783616.png",
 date: ~D[2020-07-30],
 start_time: ~T[21:00:00],
 end_time: ~T[23:59:59],
 cost: 5.00,
 location_id: 2
}

Repo.insert! %Event{
 title: "Drag Bingo Wednesdays!",
 description: "That’s right! Hamburger Mary’s is back back back again to play with some balls and give you one HELL of a time for Drag Bingo!",
 labels: ["All Ages", "Trivia", "Bingo"],
 image: "https://www.hamburgermarys.com/denver/wp/wp-content/uploads/2020/07/Bingo_2020.jpg",
 date: ~D[2020-08-08],
 start_time: ~T[18:00:00],
 end_time: ~T[21:00:00],
 cost: 0.00,
 location_id: 3
}

Repo.insert! %Event{
 title: "Sunday Drag Brunch!",
 description: "Did someone say DRAG BRUNCH!? Voted Best Drag Brunch by the Colorado DIVAs! EVERY Sunday! TWO shows at 11am and 1pm Featuring kings, queens, and everything in-betweens!",
 labels: ["All Ages", "Brunch", "Drag King"],
 image: "https://hamburgermarys.com/img/event-poster-default-900x1200.jpg",
 date: ~D[2020-08-02],
 start_time: ~T[10:00:00],
 end_time: ~T[13:00:00],
 cost: 0.00,
 location_id: 3
}

alias DragTimeApi.Repo
alias DragTimeApi.Artists.Artist

Repo.insert! %Artist{
 name: "Landon Cider",
 image: "https://media.altpress.com/uploads/2019/10/2PhotobyBrettSaariHospitalHorrorEpisode-copy.jpg",
 description: "‘DRAGULA’ SEASON 3 WINNER"
}

Repo.insert! %Artist{
 name: "Katya",
 image: "https://345v4845f1o72rvbx12u5xsh-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/1227QandA_Katya_PC-Sean-M-Johnson-.jpg",
 description: "RuPauls Drag Race Season 7"
}

Repo.insert! %Artist{
 name: "Louisiana Purchase",
 image: "https://i.redd.it/osn7mbuiwdr31.jpg",
 description: "Dragula Season 3"
}

Repo.insert! %Artist{
 name: "Yvie Oddly",
 image: "https://i.redd.it/aidxcy4iqzc21.jpg",
 description: "RuPauls Drag Race Season 11"
}

alias DragTimeApi.Repo
alias DragTimeApi.EventsArtists

Repo.insert! %EventsArtists{
  event_id: 1,
  artist_id: 1
}

Repo.insert! %EventsArtists{
  event_id: 1,
  artist_id: 2
}

Repo.insert! %EventsArtists{
  event_id: 2,
  artist_id: 3
}

Repo.insert! %EventsArtists{
  event_id: 2,
  artist_id: 4
}

Repo.insert! %EventsArtists{
  event_id: 3,
  artist_id: 4
}

Repo.insert! %EventsArtists{
  event_id: 4,
  artist_id: 3
}

Repo.insert! %EventsArtists{
  event_id: 4,
  artist_id: 1
}

Repo.insert! %EventsArtists{
  event_id: 5,
  artist_id: 4
}

Repo.insert! %EventsArtists{
  event_id: 5,
  artist_id: 2
}
