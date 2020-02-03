class Stage < ApplicationRecord
  include CommonModule
  belongs_to :goal
  has_many :todos
  validates :title, presence: true
end
