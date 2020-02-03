class Stage < ApplicationRecord
  include CommonModule
  belongs_to :goal
  has_many :todos, dependent: :delete_all
  validates :title, presence: true
end
