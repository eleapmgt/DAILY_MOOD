class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @categories = Category.all.where.not(title: "humeur generale")
    @chosen_categories = @categories.where(id: current_user.category_ids).includes(:user_categories).order("user_categories.position")
    @other_categories = @categories.where.not(id: current_user.category_ids)
  end
end
