feature 'Ability to update an existing space' do

  scenario 'A user creates a space and wants to change something' do
    sign_up
    create_listing

    visit '/spaces/user/Jack'
    click_link 'Casa de Rodriguez'

    expect(page).to have_selector(:link_or_button, 'Update space')
  end
end
