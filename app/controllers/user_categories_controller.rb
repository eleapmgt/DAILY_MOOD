class UserCategoriesController < ApplicationController
  def create
    @user_category = UserCategory.new(user: current_user, category: Category.find(params[:category_id]))
    @user_category.save
    redirect_to edit_user_path(current_user)
  end

  def destroy
    @user_category = UserCategory.find(params[:id])
    @user_category.destroy
    redirect_to edit_user_path(current_user)
  end
end
