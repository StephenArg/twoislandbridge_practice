# Two Island Bridge (aka TibChat)

###### Online chat website that pairs random users for webcam and text-based conversations. | [Demo](https://tibchat.herokuapp.com/)

### Clone and run application

* Run rails back end
  ```bash
  git clone git@github.com:StephenArg/twoislandbridge_practice.git
  bundle install
  rails s -p 3001
  ```
* Run react front end
  ```bash
  git clone git@github.com:StephenArg/react_twoislandbridge_practice.git
  npm install
  ```
  After installing packages, create a file called `.env` in the main directory and add this line to it.
  `REACT_APP_API_LOCATION=localhost:3001`
  After this, run `npm start`
  
A chat application that pairs its users randomly and allows for websocket-enabled text chat and video conferencing between the participants.

## What's being used:
- React
- Rails
- ActionCable
- OpenTok Video Chat embeds
- PostgreSQL


## Stretch Features:
- Create user profiles and more customizability (Full CRUD).
- Add Redux for better state management.
- Present column alongside chat box to display previous matches with the ability to rate them, attempt to reconnect to them, block them, review past text conversations, and more.
- Create a rating system the determines which individuals a user will match with. 
- Add a nudity sensing api to auto-ban policy breaking users.
- Improve design, rework name, and add routes.
