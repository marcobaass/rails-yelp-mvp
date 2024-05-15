class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :phone_number, presence: true
  validates :category, inclusion: %w[chinese italian japanese french belgian]
  validates :category, exclusion: [nil]
end
