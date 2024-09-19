class Positive < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :emotion_lv

  # validates :emotion_lv_id, numericality: { other_than: 1, message: "can't be blank" } 
  belongs_to :user
  belongs_to :emotion_lv
end
