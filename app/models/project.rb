class Project < ApplicationRecord
  enum status: { not_started: 0, in_progress: 1, on_hold: 2, completed: 3 }
  belongs_to :user
  has_many :comments
  has_paper_trail

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 2000 }
end
