feature 'booking a space with a date already taken' do

  scenario 'I see an error when I attempt to book an unavailable date' do
    sign_up
    create_listing
    click_button 'Sign out'
    sign_up_steph
    visit '/spaces'
    click_link 'Casa de Rodriguez'
    fill_in 'book_a_night', with: '18/06/17'
    click_button 'Request to book'
    click_button 'Sign out'
    sign_in
    visit '/requests/user'
    click_link 'Casa de Rodriguez'
    click_button 'Confirm Request'
    click_button 'Sign out'
    sign_up_ruan
    visit '/spaces'
    click_link 'Casa de Rodriguez'
    fill_in 'book_a_night', with: '18/06/17'
    click_button 'Request to book'
    expect(page).to have_content 'Date is already taken!'
  end

  scenario 'I do not see an error when I double book an unconfirmed space' do
    sign_up
    create_listing
    click_button 'Sign out'
    sign_up_steph
    visit '/spaces'
    click_link 'Casa de Rodriguez'
    fill_in 'book_a_night', with: '18/06/17'
    click_button 'Request to book'
    click_button 'Sign out'
    sign_up_ruan
    visit '/spaces'
    click_link 'Casa de Rodriguez'
    fill_in 'book_a_night', with: '18/06/17'
    click_button 'Request to book'
    expect(page).not_to have_content 'Date is already taken!'
  end

end
