class Serie < ApplicationRecord
  has_many :comics
  belongs_to :creator, :class_name => "Creator", :primary_key => "creator_id"

  validates :creator_id, presence: true
end
