feature 'Viewing spaces' do

  scenario 'View all existing spaces' do
    Space.create(name: 'Casa de Rodriguez',
                description: 'Lovely abode with stunning vistas to the Valencian coast',
                price: '500',
                available_from: '18/04/17',
                available_to: '18/04/18')
    visit '/spaces'
    expect(page.status_code).to eq 200

    within "ul#spaces" do
      expect(page).to have_content 'Casa de Rodriguez'
    end
  end

end