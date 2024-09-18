class PositivesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @positive = Positive.new
    positive_counts = Positive.group(:emotion_lv_id).count
    @chart_data = positive_counts.map do |key, value|
      { name: EmotionLv.find(key).name, data: value }
    end
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
