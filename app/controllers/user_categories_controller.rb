class UserCategoriesController < ApplicationController
  before_action :get_categories, only: [:create, :destroy]

  def create
    @user_category = UserCategory.new(user: current_user, category: Category.find(params[:category_id]))
    @user_category.save
    # respond_to do |format|
    #   # format.turbo_stream { render partial: "user_categories/move",
    #   #                       locals: { other_categories: @other_categories, chosen_categories: @chosen_categories } }
    #   format.turbo_stream { render turbo_stream: turbo_stream.prepend('chosen_categories', partial: "users/categories", locals: { categories: @chosen_categories})}
    # end
    redirect_to edit_user_path(current_user)
  end

  def destroy
    @user_category = UserCategory.find(params[:id])
    @user_category.destroy
    redirect_to edit_user_path(current_user)
  end

  private

  def get_categories
    @categories = Category.all.where.not(title: "humeur generale")
    @chosen_categories = @categories.where(id: current_user.category_ids)
    @other_categories = @categories.where.not(id: current_user.category_ids)
  end
end
