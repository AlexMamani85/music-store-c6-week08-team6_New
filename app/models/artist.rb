class Artist < ApplicationRecord
  validates :name, presence: true
  validate :date_cant_be_in_the_future
  validate :birth_date_non_greater_than_death_date
  validate :birth_date_exists?

  private

  def date_cant_be_in_the_future
    errors.add(:birth_date, "can't be in the future") if birth_date.present? && birth_date > Date.current
  end

  def birth_date_non_greater_than_death_date
    errors.add(:death_date,
         "invalid death date must be greater than birth date") if birth_date.present? && death_date.present? && birth_date > death_date
  end

  def birth_date_exists?
    errors.add(:death_date, "birth date doesn't exist") if death_date.present? && birth_date.present? == false
  end
end
