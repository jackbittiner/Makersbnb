feature 'book a space' do

  scenario 'have the ability to view a space' do
    sign_up
    create_listing
    visit '/spaces'
    click_link 'Casa de Rodriguez'

    expect(current_path).to eq '/spaces/1'

    expect(page).to have_content 'Casa de Rodriguez'
  end
  
  scenario 'have the ability to book a space' do
    sign_up
    create_listing
    visit '/spaces'
    click_link 'Casa de Rodriguez'

    click_button 'Request to book'
    expect(current_path).to eq '/requests/2'
    expect(page).to have_content 'You have requested to book Casa de Rodriguez'
  end
end
