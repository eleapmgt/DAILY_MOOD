class DiariesRewardsController < ApplicationController

  def show
    @diary_reward = DiaryReward.find(params[:id])
  end
end
