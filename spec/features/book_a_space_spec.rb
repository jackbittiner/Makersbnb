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
    # Cannot be the same user as the one who created the listing
    sign_up(username: "Jess",
            firstname: "Jess",
            lastname: "Rodriguez",
            email: 'jess@example.com',
            password: '123',
            password_confirmation: '123')
    visit '/spaces'
    click_link 'Casa de Rodriguez'

    expect {click_button 'Request to book'}.to change(Request, :count).by(1)
    expect(current_path).to eq '/request/1'
    expect(page).to have_content 'You have requested to book Casa de Rodriguez'
    expect(page).to have_content 'pending'
  end

end
