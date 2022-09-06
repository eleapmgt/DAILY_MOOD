class DiariesRewardsController < ApplicationController

  def new
    @diary_reward = DiaryReward.new()
  end

  def create
    # raise
  end
end
