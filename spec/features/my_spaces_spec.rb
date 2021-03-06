feature "viewing a user's spaces" do

  scenario "I can view the spaces of a specific user" do

    sign_up
    create_listing(name: 'Casa de Jack',
                  description: 'Has a functioning water closet',
                  price: '1000',
                  available_from: '18/04/17',
                  available_to: '18/04/18')
    visit '/spaces/user/Jack'
    expect(page).to have_content("Casa de Jack")
    expect(page).to have_content("Jack's spaces")
  end

  scenario 'I can navigate to my listed spaces' do
    sign_up
    create_listing
    create_listing(name: 'Casa de Jack',
                  description: 'Has a functioning water closet',
                  price: '1000',
                  available_from: '18/04/17',
                  available_to: '18/04/18')
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Manage my spaces')

    click_link 'Manage my spaces'
    expect(current_path).to eq '/spaces/user/Jack'
  end

  scenario 'I cannot book my own space' do
    sign_up
    create_listing

    visit '/spaces/user/Jack'
    click_link 'Casa de Rodriguez'
    expect(page).not_to have_selector(:link_or_button, 'Request to book')
  end

end
