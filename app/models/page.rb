class Page < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :active, inclusion: { in: [true, false] }
end
