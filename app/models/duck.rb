class Duck < ApplicationRecord
  belongs_to :student

  validates :name, :description, length: { minimum: 1 }
end
