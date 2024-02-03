<<<<<<< HEAD
=======
# frozen_string_literal: true

# This helper provides methods for the homepage
>>>>>>> dcecf69b30970763751a1e57ac85f15bdcac83e5
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_create :increment_user_posts_count

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_user_posts_count
    author.increment!(:posts_counter)
  end
end
