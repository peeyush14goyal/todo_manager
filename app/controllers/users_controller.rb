class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New User is created with this id : #{new_user.id}"
    render plain: response_text
  end

  def findUser
    email = params[:email]
    password = params[:password]
    user = User.find { |user| (user.email == email) && (user.password == password) }
    render plain: user ? true : false
  end
end
