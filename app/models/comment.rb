class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_comment_post_count

  private

  def increment_comment_post_count
    post.increment!(:comment_count)
  end
end
