class Student < ApplicationRecord
  has_many :ducks

  validates :name, length: { minimum: 1 }
  validates :mod, :numericality=> true, :exclusion => {:in => 1..5, :message=> "Only mods 1 - 5"}
end
