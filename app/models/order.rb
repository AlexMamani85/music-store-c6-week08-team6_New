class Order < ApplicationRecord
  belongs_to :customer
  validates :date, presence: true
  validate :date_cant_be_in_the_future
  validates :total, numericality: { greater_than: 0 }

  private

  def date_cant_be_in_the_future
    errors.add(:date, "can't be in the future") if date.present? && date > Date.current
  end
end
