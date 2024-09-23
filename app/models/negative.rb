class Negative < ApplicationRecord
  belongs_to :user
  belongs_to :emotion_lv
  has_many :tags, through: :negative_tag_relations
end
