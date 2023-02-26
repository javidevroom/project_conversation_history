class Project < ApplicationRecord
  enum status: { NotStarted: 0, InProgress: 1, OnHold: 2, Completed: 3 }

  belongs_to :user
  has_many :comments

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 2000 }
end
