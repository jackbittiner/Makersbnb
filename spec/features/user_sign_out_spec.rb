feature 'User signs out' do

  before(:each) do
    User.create(username: 'username',
                firstname: 'firstname',
                lastname: 'lastmane',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
