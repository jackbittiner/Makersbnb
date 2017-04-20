feature 'viewing own requests' do

  scenario 'table of my requests is empty if I have made none' do
    sign_up
    create_listing
    click_button 'Sign out'
    sign_up_steph
    visit '/requests/user'
    expect(page).not_to have_content('Casa de Rodriguez')
  end
  
  scenario 'Can see my own requests' do
    sign_up
    create_listing
    click_button 'Sign out'
    sign_up_steph
    visit '/spaces'
    click_link 'Casa de Rodriguez'
    click_button 'Request to book'
    visit '/requests/user'
    expect(page).to have_content('Casa de Rodriguez')
  end
end
