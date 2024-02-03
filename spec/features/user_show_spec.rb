require 'rails_helper'

RSpec.feature 'User Show View', type: :feature do
  scenario 'User views user show page with three recent posts' do
    user = User.create(name: 'Alice', photo: 'https://example.com/alice.jpg', bio: 'Test bio')
    post1 = user.posts.create(title: 'Post 1', text: 'First post by Alice', comment_counter: 2, like_counter: 3)
    post2 = user.posts.create(title: 'Post 2', text: 'Second post by Alice', comment_counter: 1, like_counter: 1)
    post3 = user.posts.create(title: 'Post 3', text: 'Third post by Alice', comment_counter: 1, like_counter: 1)

    visit user_path(user)

    expect(page).to have_selector('.container')
    expect(page).to have_selector('.user_info')
    expect(page).to have_selector('.user_bio')
    expect(page).to have_css('.user-photo')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content(user.bio)

    expect(page).to have_selector('.post', count: 3)
    expect(page).to have_link('Post', href: user_post_path(user, post1))
    expect(page).to have_link('Post', href: user_post_path(user, post2))
    expect(page).to have_link('Post', href: user_post_path(user, post3))
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
    expect(page).to have_css('.count', text: "Comments: #{post1.comments.count} | Likes: #{post1.likes.count}")
    expect(page).to have_css('.count', text: "Comments: #{post2.comments.count} | Likes: #{post2.likes.count}")
    expect(page).to have_css('.count', text: "Comments: #{post3.comments.count} | Likes: #{post3.likes.count}")

    expect(page).to have_link('See all posts', href: user_posts_path(user))
  end
end
