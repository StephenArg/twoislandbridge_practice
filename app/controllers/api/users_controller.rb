class Api::UsersController < ApplicationController

  def create
    @user = User.new(name: params["name"], password: params["password"], location: params["location"])
    if @user.save
      payload = {name: @user.name}
      token = JWT.encode(payload, "secretPass7")
      render json: {user: @user, jwt: token}
      puts "Saved"
    else
      puts "Error"
    end
  end

  def login
    @user = User.find do |u|
      u.name.downcase == params["name"].downcase
    end
    if @user && @user.authenticate(params["password"])
      @user.update(location: params["location"])
      payload = {name: @user.name}
      token = JWT.encode(payload, "secretPass7")
      render json: {user: @user, jwt: token}
    end

  end

  def authenticate
    if JWT.decode(params["jwt"], "secretPass7")
      @user = User.find do |u|
        u.name.downcase == JWT.decode(params["jwt"], "secretPass7")[0]["name"].downcase
      end
      render json: @user
    end
    #  The way the auth works is if there is no user object in the local storage on the client's front end,
    #  the page will load a log in and sign up form. If the user does either one a post request is made to
    # create their account or log in, which generates then returns a token and a user object. These are
    # stored in the users local storage, their main app's state is set to logged in, and they will stay
    # logged in each time unless they delete their local storage or sign out.
    # Potential changes will be turning their email into a jwt token, as emails will be unique, not names.

  end


end
