class PatientsController < ApplicationController
  def index
    if params[:query].present?
      @patients = current_user.patients.where("username ILIKE ?", "%#{params[:query]}%")
    else
      @patients = current_user.patients
    end
  end

  def show
    @patient = current_user.patients.find(params[:id])
    @principal_category = Category.principal
    @secondary_categories = Category.secondary
  end
end
