class Stage < ApplicationRecord
  belongs_to :goal
  has_many :todos, dependent: :destroy
  validates :title, presence: true
end
