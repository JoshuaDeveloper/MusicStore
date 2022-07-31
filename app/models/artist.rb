class Artist < ApplicationRecord
  validates :name, presence: true
  validate :valid_future_birth, :valid_too_old, :valid_death_after_birth

  def valid_future_birth
    return if birth_date.nil?

    return if birth_date < Time.zone.today

    errors.add(:birth_date, "You can't born in the future")
  end

  def valid_too_old
    return if birth_date.nil?

    return if birth_date > 120.years.ago

    errors.add(:birth_date, "More than 120 years? How are you still alive?!")
  end

  def valid_death_after_birth
    return if birth_date.nil? && death_date.nil?

    return if death_date.nil?

    if birth_date
      return if birth_date < death_date

      errors.add(:death_date, "You must have been birth to have a death date")
    else
      errors.add(:death_date, "No birth date added")
    end
  end
end
