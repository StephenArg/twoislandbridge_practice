# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


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
  `REACT_APP_API_LOCATION=localhost:3000`
  After this, run `npm start`
  
