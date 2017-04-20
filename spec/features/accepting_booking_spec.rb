feature 'Accepting a booking request' do

  scenario 'A user makes a booking request and a lister can approve' do
    sign_up
    create_listing
    
    sign_up_steph

    visit '/spaces'
    click_link 'Casa de Rodriguez'
    fill_in 'book_a_night', with: '18/04/17'
    click_button 'Request to book'

    sign_in
    visit '/request/1'
    expect(page).to have_selector(:link_or_button, 'Confirm Request')
    expect(page).to have_selector(:link_or_button, 'Decline Request')
  end
end
