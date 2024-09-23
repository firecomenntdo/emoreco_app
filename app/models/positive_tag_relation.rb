class PositiveTagRelation < ApplicationRecord
  belongs_to :positive
  belongs_to :tag
end
