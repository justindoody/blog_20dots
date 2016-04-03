describe 'admin processes', type: :feature, js: true do
  def login_as_admin(password: 'password')
    visit '/admin'
    within('#login_container') do
      fill_in 'Password', with: password
    end
    click_button 'Log In'
  end

  context 'log in with wrong password' do
    it 'fails to log in' do
      create(:admin)
      login_as_admin(password: 'wrongpass')
      expect(page).to have_content 'Wrong password'
    end
  end

  context 'log in with good password' do
    it 'successfully logs in and creates post' do
      create(:admin)
      login_as_admin
      expect(page).to have_content 'logout'

      post_count = Post.count
      click_link 'new_post_button'
      expect(Post.count).to eq post_count + 1
    end
  end
end