require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before(:each) do
 
  end

  it 'should display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'should render user profile photo' do
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'should displays static text' do
    expect(page).to have_content('Posts')
  end

  it 'Shows the User name' do
    expect(page).to have_content(@user1)
  end

  it 'shows number of user posts ' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'it should render the view all user posts link' do
    expect(page).to have_link('See all posts')
  end

  it 'should render three recent posts' do
    expect(page).to have_content(@user.recent_three_posts[0])
    expect(page).to have_content(@user.recent_three_posts[1])
    expect(page).to have_content(@user.recent_three_posts[2])
    expect(page).to have_no_content(Post.where(user: @user))
  end
end
