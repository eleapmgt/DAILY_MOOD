class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user && current_user.is_doctor
      redirect_to doctor_home_path
    end
  end

  def doctor_home
  end
end
