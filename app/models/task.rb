class Task < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 230 }
  validates :status, presence: true, length: { maximum: 20 }
end
