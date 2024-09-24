class NegativeTagRelation < ApplicationRecord
  belongs_to :negative
  belongs_to :tag
end
