# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_like_count
  after_destroy :decrement_post_like_count

  def increment_post_like_count
    post.increment!(:like_count)
  end

  def decrement_post_like_count
    post.decrement!(:like_count)
  end
end
