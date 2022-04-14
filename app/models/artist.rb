class Artist < ApplicationRecord
  validates :name, presence: true
  validate :date_cant_be_in_the_future
  validate :birth_date_non_greater_than_death_date
  validate :birth_date_exists?

  private

  def date_cant_be_in_the_future
    return unless birth_date.present? && birth_date > Date.current

    errors.add(:birth_date,
               "can't be in the future")
  end

  def birth_date_non_greater_than_death_date
    return unless birth_date.present? && death_date.present? && birth_date > death_date

    errors.add(:death_date,
               "invalid death date must be greater than birth date")
  end

  def birth_date_exists?
    return unless death_date.present? && birth_date.present? == false

    errors.add(:death_date,
               "birth date doesn't exist")
  end
end
