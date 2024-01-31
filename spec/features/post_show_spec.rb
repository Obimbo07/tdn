require 'rails_helper'

RSpec.feature 'Post Show View', type: :feature do
  scenario 'User views post show page' do
    user = User.create(name: 'Austin', photo: 'https://example.com', bio: 'Integration test user', posts_counter: 1)
    post = Post.create(author: user, title: 'Hi', text: 'First Post', comment_counter: 2, like_counter: 3)
    post.comments.create(user:, text: 'Great post!')
    post.comments.create(user:, text: 'Nice job!')

    visit user_post_path(user, post)

    expect(page).to have_selector('.container')
    expect(page).to have_selector('.post')
    expect(page).to have_content("Post: #{post.title}")
    expect(page).to have_css('.count', text: 'Comments: #{post.comments.count}')
    expect(page).to have_css('.count', text: 'Likes: #{post.likes.count}')
    expect(page).to have_content(post.text)

    expect(page).to have_selector('.comments')
    post.comments.each do |comment|
      expect(page).to have_selector('.comment', text: "#{comment.user.name} : #{comment.text}")
    end
  end
end
