class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6, message: 'must be at least 6 char min' }
  validates :list, uniqueness: { scope: :movie }
end
