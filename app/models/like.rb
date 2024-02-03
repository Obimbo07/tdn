<<<<<<< HEAD
=======
# frozen_string_literal: true

# This helper provides methods for the homepage
>>>>>>> dcecf69b30970763751a1e57ac85f15bdcac83e5
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_like_count
  after_destroy :decrement_post_like_count

  def increment_post_like_count
    post.increment!(:like_counter)
  end

  def decrement_post_like_count
    post.decrement!(:like_counter)
  end
end
