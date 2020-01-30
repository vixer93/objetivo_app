class Goal < ApplicationRecord
  validates :title, presence: true

  has_many :stages
end
