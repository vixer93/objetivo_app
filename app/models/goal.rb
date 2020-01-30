class Goal < ApplicationRecord
  has_many :stages
  validates :title, presence: true
end
