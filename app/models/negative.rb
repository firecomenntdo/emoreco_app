class Negative < ApplicationRecord
  belongs_to :user
  belongs_to :emotion_lv
  has_many :negative_tag_relations
  has_many :tags, through: :negative_tag_relations

  def save_tag(sent_tags)
    sent_tags ||= []
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    current_tags ||= []

    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new, user_id: user_id)
      self.tags << new_post_tag
   end
  end
end
