class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    if (name.to_s.length > 0 && email.to_s.length > 0 && password.to_s.length > 0)
      new_user = User.create!(
        name: name,
        email: email,
        password: password,
      )
      response_text = "New User is created with this id : #{new_user.id}"
    else
      response_text = "ERROR: Name or email or password is Empty"
    end
    render plain: response_text
  end

  def findUser
    email = params[:email]
    password = params[:password]
    user = User.find { |user| (user.email == email) && (user.password == password) }
    render plain: user ? true : false
  end
end
