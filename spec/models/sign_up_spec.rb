feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Jack Dopeyman!')
    expect(User.first.email).to eq('jackdopeyman@hotmail.com')
  end

  scenario 'incorrect confirmation does not create user' do
    expect {sign_up(password_confirmation: '123')}.to change(User, :count).by(0)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: '123') }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user must enter an name' do
    expect {sign_up(firstname: "")}.not_to change(User, :count)
  end

  scenario 'user must enter an name' do
    expect {sign_up(lastname: "")}.not_to change(User, :count)
  end

  scenario 'user must enter an email address' do
    expect {sign_up(email: "")}.not_to change(User, :count)
  end

  scenario 'user must enter a password' do
    expect {sign_up(password: "")}.not_to change(User, :count)
  end

  scenario 'user must confirm their password' do
    expect {sign_up(password_confirmation: "")}.not_to change(User, :count)
  end

  scenario 'email has to be valid' do
    expect {sign_up(email: "sjdc")}.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
