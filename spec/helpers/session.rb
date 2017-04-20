module SessionHelpers

  def sign_up(username: "Jack",
              firstname: "Jack",
              lastname: "Dopeyman",
              email: 'jackdopeyman@hotmail.com',
              password: 'stephstephsteph',
              password_confirmation: 'stephstephsteph')
    visit '/'
    fill_in :username, with: username
    fill_in :firstname, with: firstname
    fill_in :lastname, with: lastname
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_up_steph(username: 'Steph',
          firstname: 'Steph',
          lastname: 'Cr',
          email: 'steph@steph.steph',
          password: 'steph',
          password_confirmation: 'steph')
    visit '/'
    fill_in :username, with: username
    fill_in :firstname, with: firstname
    fill_in :lastname, with: lastname
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email: "jackdopeyman@hotmail.com",
                password: "stephstephsteph")
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
