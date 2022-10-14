class Creator < ApplicationRecord
  has_many :series

  validates :creator_id, presence: true
end
