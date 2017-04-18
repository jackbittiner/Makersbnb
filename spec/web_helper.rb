
def sign_up(name: "Jack Dopeyman",
              email: 'jackdopeyman@hotmail.com',
              password: 'stephstephsteph',
              password_confirmation: 'stephstephsteph')
    visit '/'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
