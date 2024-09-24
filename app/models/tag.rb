class Tag < ApplicationRecord
  validates :name, uniqueness: { scope: :user_id }, length: { maximum: 30 }

  belongs_to :user, optional: true
  has_many :positive_tag_relations
  has_many :positives, through: :emotion_tag_relations
  has_many :negatives, through: :emotion_tag_relations
end
