feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Jack Dopeyman!')
    expect(User.first.email).to eq('jackdopeyman@hotmail.com')
  end

  scenario 'incorrect confirmation does not create user' do
    expect {sign_up(password_confirmation: '123')}.to change(User, :count).by(0)
  end
end
