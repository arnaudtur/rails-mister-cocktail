class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_one_attached :photo
  validates :photo, attached: true
  has_many :doses
  has_many :ingredients, through: :doses, dependent: :destroy
end
