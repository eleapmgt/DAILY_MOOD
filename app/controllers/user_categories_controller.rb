class UserCategoriesController < ApplicationController
  def create
    @user_category = UserCategory.new(user: current_user, category: Category.find(params[:category_id]))
    @user_category.save
    respond_to do |format|
      format.html { redirect_to edit_user_path(current_user) }
      format.text { render partial: "users/category", locals: { category: @user_category.category }, formats: [:html] }
    end
  end

  def update
    @user_category = UserCategory.find(params[:id])
    @user_category.update(user_category_params)
  end

  def destroy
    @user_category = UserCategory.find(params[:id])
    @user_category.destroy
    respond_to do |format|
      format.html { redirect_to edit_user_path(current_user) }
      format.text { render partial: "users/category", locals: { category: @user_category.category }, formats: [:html] }
    end
  end

  private

  def user_category_params
    params.require(:user_category).permit(:position)
  end
end
