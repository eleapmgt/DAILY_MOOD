class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
   @user = User.find(params[:id])
  end

  def edit
    @categories = Category.all.where.not(title: "humeur generale")
  end
end
