# DragTimeApi

## About Our API

Drag Time is the preferred site to find local drag events. Performers can post their event to our website, and users can search, favorite, and RSVP to their events. This API feeds and stores data for the front end React application, [Drag Time](https://github.com/drag-time/drag-time-fe). Our API holds various data points:
1) Event information. Including the location, date and time of event, thumbnail photo, and drag artists.
2) Location. Including the venue name, address, city, state, and zip code.
3) Artists. Including the name, description, and thumbnail photo.

Checkout out our app in production:
> [Drag Time](https://inspiring-wescoff-a24deb.netlify.app/)

> [Drag Time API](https://evening-savannah-63945.herokuapp.com/)

![Database Schema](https://user-images.githubusercontent.com/50503353/88851344-e16e4580-d1a9-11ea-9ace-c43305f5fc46.png)



## Endpoints

There are several valid endpoints.
> GET/POST/PATCH/DELETE `api/events`

Returns All Events

Request:
```
GET /api/events
Content-Type: application/json
Accept: application/json
```

Response:
```
status: 200

{
  "data": [
    {
      "artists": [
        {
          "description": "‘DRAGULA’ SEASON 3 WINNER",
          "id": 1,
          "image": "https://media.altpress.com/uploads/2019/10/2PhotobyBrettSaariHospitalHorrorEpisode-copy.jpg",
          "name": "Landon Cider"
        },
        {
          "description": "RuPauls Drag Race Season 7",
          "id": 2,
          "image": "https://345v4845f1o72rvbx12u5xsh-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/1227QandA_Katya_PC-Sean-M-Johnson-.jpg",
          "name": "Katya"
        }
      ],
      "cost": 10,
      "date": "2020-02-29",
      "description": "Monsters and beauty queens unite for a one-of-a-kind drag experience. Along with Denver's hottest drag entertainers, we give you the glamour, filth, and horror that is the underground drag scene.",
      "end_time": "23:59:59",
      "id": 1,
      "image": "https://tracksdenver.com/wp-content/uploads/2019/06/02_28_DragNation3_Web.jpg",
      "labels": [
        "21+",
        "Cover Charge",
        "Drag King"
      ],
      "location": {
        "address": "3500 Walnut St",
        "city": "Denver",
        "id": 1,
        "name": "Tracks",
        "state": "CO",
        "zip": "80205"
      },
      "start_time": "22:00:00",
      "title": "DRAG NATION",
      "type": "event"
    },
    ...
  ]
}
```

Request:
```
POST /api/events
Content-Type: application/json
Accept: application/json

Params:

{
    "event": {
        "title": "Drag Bingo Thursdays!",
        "description": "That’s right! Hamburger Mary’s is back back back again to play with some balls and give you one HELL of a time for Drag Bingo!",
        "labels": ["18+", "Trivia", "Bingo"],
        "image": "https://www.hamburgermarys.com/denver/wp/wp-content/uploads/2020/07/Bingo_2020.jpg",
        "date": "2020-08-31",
        "start_time": "20:00:00",
        "end_time": "23:00:00",
        "cost": 5.00,
        "location_id": 2
    }
}
```

Response:
```
status: 201

{
    "cost": 5.0,
    "date": "2020-08-31",
    "description": "That’s right! Hamburger Mary’s is back back back again to play with some balls and give you one HELL of a time for Drag Bingo!",
    "end_time": "23:00:00",
    "id": 20,
    "image": "https://www.hamburgermarys.com/denver/wp/wp-content/uploads/2020/07/Bingo_2020.jpg",
    "labels": [
        "18+",
        "Trivia",
        "Bingo"
    ],
    "location_id": 2,
    "start_time": "20:00:00",
    "title": "Drag Bingo Thursdays!",
    "type": "event"
}
```

> GET/POST/PATCH/DELETE `api/locations`

Request:
```
GET /api/locations
Content-Type: application/json
Accept: application/json
```

Response:
```
status: 200

{
    "data": [
        {
            "address": "3500 Walnut St",
            "city": "Denver",
            "id": 1,
            "name": "Tracks",
            "state": "CO",
            "zip": "80205"
        },
        {
            "address": "900 E Colfax Ave",
            "city": "Denver",
            "id": 2,
            "name": "Charlie's Nightclub Denver",
            "state": "CO",
            "zip": "80218"
        },
    ...
    ]
}
```

Request:
```
POST /api/locations
Content-Type: application/json
Accept: application/json

Params:

{
    "location": {
        "name": "Cheer Up Charlies",
        "address": "900 Red River St",
        "city": "Austin",
        "state": "TX",
        "zip": "78701"
    }
}
```

Response:
```
status: 201

{
    "data": {
        "address": "900 Red River St",
        "city": "Austin",
        "id": 7,
        "name": "Cheer Up Charlies",
        "state": "TX",
        "zip": "78701"
    }
}
```

> GET/POST/PATCH/DELETE `api/artists`

Request:
```
GET /api/artists
Content-Type: application/json
Accept: application/json
```

Response:
```
status: 200

{
    "data": [
        {
            "description": "‘DRAGULA’ SEASON 3 WINNER",
            "id": 1,
            "image": "https://media.altpress.com/uploads/2019/10/2PhotobyBrettSaariHospitalHorrorEpisode-copy.jpg",
            "name": "Landon Cider"
        },
        {
            "description": "RuPauls Drag Race Season 7",
            "id": 2,
            "image": "https://345v4845f1o72rvbx12u5xsh-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/1227QandA_Katya_PC-Sean-M-Johnson-.jpg",
            "name": "Katya"
        },
      ...
      ]
}
```

Request:
```
POST /api/artists
Content-Type: application/json
Accept: application/json

Params:
{
    "artist": {
        "name": "Yvie Oddly",
        "image": "https://i.redd.it/aidxcy4iqzc21.jpg",
        "description": "RuPauls Drag Race Season 11"
    }
}

```

Response:
```
status: 201

{
    "data": {
        "description": "RuPauls Drag Race Season 11",
        "id": 5,
        "image": "https://i.redd.it/aidxcy4iqzc21.jpg",
        "name": "Yvie Oddly"
    }
}
```
