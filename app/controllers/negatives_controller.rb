class NegativesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @negative = Negative.new
  end
  def create
    @negative = Negative.new(negative_params)
    if @negative.save
      redirect_to negatives_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def negative_params
    params.require(:negative).permit(:emotion_lv_id,:negative_context).merge(user_id: current_user.id)
  end
end
