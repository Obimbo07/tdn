require 'rails_helper'

RSpec.feature 'Post Index View', type: :feature do
  scenario 'User views post index page' do
    user = User.create(name: 'Austin', photo: 'https://example', bio: 'Intergration test user', posts_counter: 1)
    Post.create(author: user, title: 'Hi', text: 'First Post', comment_counter: 1, like_counter: 3)
    visit user_posts_path(user)

    expect(page).to have_selector('.user_info')
    expect(page).to have_selector('.user-photo')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")

    expect(page).to have_selector('.post', count: 1)
    expect(page).to have_link('Post', href: user_post_path(user, user.posts.first))
    expect(page).to have_content(user.posts.first.text)
    expect(page).to have_css('.count', text: "Comments: #{user.posts.first.comments.count}")
    expect(page).to have_css('.count', text: "Likes: #{user.posts.first.likes.count}")

    expect(page).to have_selector('.comments', count: 1)
    user.posts.first.recent_comments.each do |comment|
      expect(page).to have_content("#{comment.user.name} : #{comment.text}")
    end

    expect(page).to have_link('Pagination', href: user_posts_path(user))
  end
end
