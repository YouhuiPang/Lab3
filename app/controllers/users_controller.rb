class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: "...", password_digest: "...", status: "...")
  end

end
