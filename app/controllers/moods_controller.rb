class MoodsController < ApplicationController

  def index
    @moods = Mood.all
    @mood = Mood.new
    @diary = Diary.find(params[:diary_id])
  end

  def create
    @diary = Diary.find(params[:diary_id])
    @mood = Mood.new(mood_params)
    @mood.diary = @diary
    @mood = Mood.save
    redirect_to diary_moods path(@mood)
  end

  def update
  end


  def destroy
  end

  private

  def mood_params
    params.require(:mood).permit(:title, :content, :principal, :rating)
  end
end
