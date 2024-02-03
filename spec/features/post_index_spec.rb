require 'rails_helper'

RSpec.feature 'Post Index View', type: :feature do
  scenario 'User views post index page' do
    user = User.create(name: 'Austin', photo: 'https://example', bio: 'Integration test user', posts_counter: 0)
    post = Post.create(author: user, title: 'Hi', text: 'First Post', comment_counter: 1, like_counter: 3)

    visit user_posts_path(user)

    expect(page).to have_selector('.user_info')
    expect(page).to have_selector('.user-photo')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")

    expect(page).to have_selector('.post', count: 1)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_css('.count', text: "Comments: #{post.comments.count}")
    expect(page).to have_css('.count', text: "Likes: #{post.likes.count}")

    expect(page).to have_selector('.comments', count: 1)
    post.recent_comments.each do |comment|
      expect(page).to have_content("#{comment.user.name} : #{comment.text}")
    end

    expect(page).to have_link('Pagination', href: user_posts_path(user))
    expect(page).to have_link('Add New post', href: new_user_post_path(user))
  end
end
