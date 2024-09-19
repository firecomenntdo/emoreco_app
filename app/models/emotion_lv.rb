class EmotionLv < ApplicationRecord
  has_many :positives
  has_many :negatives
end
