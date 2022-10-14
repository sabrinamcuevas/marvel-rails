class Character < ApplicationRecord
  belongs_to :comic, :class_name => "Comic", :primary_key => "comic_id"

  validates :comic_id, presence: true
end
