# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'comment_counter' do
    it 'increments when a new comment is created' do
      user = User.new(name: 'John Doe', posts_counter: 0)
      post = Post.new(title: 'foo', text: 'out', author: user, comment_counter: 0, like_counter: 2)
      comment = Comment.new(text: 'Nice post!', user:, post:)

      expect do
        comment.save
        user.save
        post.reload
      end.to change(post, :comment_counter).by(1)
    end

    it 'does not change when a comment is destroyed' do
      user = User.new(name: 'John Doe', posts_counter: 0)
      post = Post.new(title: 'foo', text: 'out', author: user, comment_counter: 0, like_counter: 2)
      comment = Comment.new(text: 'Nice post!', user:, post:)

      comment.save
      expect do
        comment.destroy
        post.reload
      end.not_to change(post, :comment_counter)
    end
  end
end
