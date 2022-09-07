class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user && current_user.is_doctor
      redirect_to patients_path
    end
  end
end
