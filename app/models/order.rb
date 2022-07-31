class Order < ApplicationRecord
  validates :total, numericality: { greater_than: 0 }
  validates :date, comparison: { less_than: Time.zone.today }
end
