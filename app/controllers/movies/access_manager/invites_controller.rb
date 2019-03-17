class Movies::AccessManager::InvitesController < ApplicationController
  before_action :set_movie

  def new
    @permissions = Permission.all
  end

  def create
    return render text: "Not supported."
    user = User.find_by_email(params[:email])

    return handle_existing_user(user) if user
    handle_new_user()
  end

  def handle_existing_user(user)

  end

  def handle_new_user

  end
end
