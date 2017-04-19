feature 'list many spaces' do

  scenario 'add multiple spaces' do
    sign_up
    create_listing
    create_listing(name: "Ruan's flat", description: 'A lame flat', price: '200')
    expect(current_path).to eq '/spaces'

    within 'ul#spaces' do
      expect(page).to have_content 'Casa de Rodriguez'
      expect(page).to have_content "Ruan's flat"
    end
  end
end
