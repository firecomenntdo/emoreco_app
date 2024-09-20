class NegativesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @new_negative = Negative.new
    @negative = current_user.negatives.where('extract(year from negatives.created_at) 
= ? AND extract(month from negatives.created_at) = ?', 
Time.now.year, Time.now.month)

@negative_ratio = @negative.joins("LEFT JOIN emotion_lvs ON emotion_lvs.id = negatives.emotion_lv_id")
.group("emotion_lvs.level").count

  end
  def create
    @negative = Negative.new(negative_params)
    if @negative.save
      redirect_to negatives_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  def show
  end
  private
  def negative_params
    params.require(:negative).permit(:emotion_lv_id,:negative_context).merge(user_id: current_user.id)
  end
end
