# frozen_string_literal: true

# This helper provides methods for the homepage
class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  after_create :increment_comment_post_count
  validates :text, presence: true, length: { maximum: 250 }

  private

  def increment_comment_post_count
    post.increment!(:comment_counter)
  end
end
