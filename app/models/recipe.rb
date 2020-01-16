class Recipe < ApplicationRecord
  has_and_belongs_to_many(:ingredients)
  validates :name, presence: true
  validates :category, presence: true
  validates :rank, presence: true
  validates :instructions, presence: true
  validates_length_of :name, maximum: 100
  validates :name, format: { with: /[a-z\s]/i, message: "only allows letters" }
  validates :category, format: { with: /[a-z\s]/i,
  message: "only allows letters" }
  validates :instructions, format: { with: /[a-z\s]/i,
  message: "only allows letters" }

end
