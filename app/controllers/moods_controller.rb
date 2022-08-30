class MoodsController < ApplicationController

  def index
    @mood = Mood.all
  end

  def create
  end

  def update
  end


  def destroy
  end
end
