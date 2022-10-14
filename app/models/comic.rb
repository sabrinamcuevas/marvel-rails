class Comic < ApplicationRecord
  has_many :characters
  belongs_to :serie, :class_name => "Serie", :primary_key => "serie_id"

  validates :serie_id, presence: true
end
