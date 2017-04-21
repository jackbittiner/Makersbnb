feature 'Ability to update an existing space' do

  scenario 'A user creates a space and wants to change something' do
    sign_up
    create_listing

    visit '/spaces/user/Jack'
    click_link 'Casa de Rodriguez'

    expect(page).to have_selector(:link_or_button, 'Update my space')
  end

  scenario 'A updated space should be different after update' do
    sign_up
    create_listing

    visit '/spaces/user/Jack'
    click_link 'Casa de Rodriguez'

    click_button 'Update my space'
    expect(current_path).to eq '/spaces/update'

    fill_in 'name', with: 'Jacks House'
    click_button 'Update my space'

    expect(current_path).to eq '/spaces/user/Jack'
    expect(page).not_to have_selector(:link_or_button, 'Casa de Rodriguez')
    expect(page).to have_selector(:link_or_button, 'Jacks House')

  end

end
