class Stage < ApplicationRecord
  belongs_to :goal
  has_many :todos, dependent: :delete_all
  validates :title, presence: true
end
