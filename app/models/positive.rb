class Positive < ApplicationRecord
  belongs_to :user
  belongs_to :emotion_lv
  has_many :tags, through: :positive_tag_relations
end
