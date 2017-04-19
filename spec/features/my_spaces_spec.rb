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

end
