class Song < ApplicationRecord
  validates :album_id, :name, presence: true
  validates :duration, numericality: { greater_than: 60 }
end
