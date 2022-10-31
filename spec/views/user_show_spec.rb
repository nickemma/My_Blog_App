require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Nicholas Emmanuel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a software developer. Optimistic, keen and a tech enthusiast, Student at Microverse.', posts_counter: 9)

    5.times do |i|
      Post.create(user: @user, title: "Post #{i}", text: 'Nice Job Well Done Today')
    end
    visit user_path(id: @user.id)
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
    expect(page).to have_content @user1
  end

  it 'shows number of user posts ' do
    expect(page).to have_content(@user.posts_counter)
  end

  # it 'i can see three recent posts' do
  #   expect(page).to have_content(@user.three_recent_posts[0].title)
  #   expect(page).to have_content(@user.three_recent_posts[1].title)
  #   expect(page).to have_content(@user.three_recent_posts[2].title)
  # end

end