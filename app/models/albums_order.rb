class AlbumsOrder < ApplicationRecord
  validates :album_quantity, :sub_total, numericality: { greater_than: 0 }
end
