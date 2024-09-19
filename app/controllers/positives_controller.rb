class PositivesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @new_positive = Positive.new
    @positive = Positive.where('extract(year from positives.created_at) 
= ? AND extract(month from positives.created_at) = ?', 
Time.now.year, Time.now.month)

@positive_ratio = @positive.joins("LEFT JOIN emotion_lvs ON emotion_lvs.id = positives.emotion_lv_id")
.group("emotion_lvs.level").count

  end

  def create
    @positive = Positive.new(positive_params)
    if @positive.save
      redirect_to positives_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def positive_params
    params.require(:positive).permit(:emotion_lv_id,:positive_context).merge(user_id: current_user.id)
  end
end
