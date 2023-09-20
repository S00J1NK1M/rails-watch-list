class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # validates_uniqueness_of :movie_id, scope: [:list_id]
  validates :movie_id, uniqueness: {scope: :list_id, message: "is already in the list"}
  validates :comment, presence: true, length: { minimum: 6 }
end
