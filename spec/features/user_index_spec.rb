require 'rails_helper'
RSpec.feature "Users Index View", type: :feature do
  scenario "User views users index page" do
    user1 = User.create(name: 'Alice', photo: 'https://example.com/alice.jpg')
    user1.posts.create(title: 'Post 1', text: 'First post by Alice')
    user1.posts.create(title: 'Post 2', text: 'Second post by Alice')
    user2 = User.create(name: 'Bob', photo: 'https://example.com/bob.jpg')
    user2.posts.create(title: 'Post 3', text: 'First post by Bob')
    visit users_path
    expect(page).to have_selector('.container')
    expect(page).to have_selector('.user_info', count: 4)
    expect(page).to have_css('.user-photo', count: 4)
    expect(page).to have_link('Alice', href: user_path(user1))
    expect(page).to have_link('Bob', href: user_path(user2))
    within('.user_info', text: 'Alice') do
      expect(page).to have_content("Number of posts: #{user1.posts.count}")
    end
    within('.user_info', text: 'Bob') do
      expect(page).to have_content("Number of posts: #{user2.posts.count}")
    end
  end
end