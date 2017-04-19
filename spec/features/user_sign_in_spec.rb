feature 'for users signing in' do

  scenario 'user signs in with correct credentials' do
    sign_up
    sign_up(email: 'steph@steph.steph')
    sign_in
    expect(page).to have_content "Welcome, Jack Dopeyman"
  end
end
