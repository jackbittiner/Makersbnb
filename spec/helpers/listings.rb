module ListingHelpers

  def create_listing(name: 'Casa de Rodriguez',
                    description: 'Lovely abode with stunning vistas to the Valencian coast',
                    price: '500',
                    available_from: '18/04/17',
                    available_to: '18/04/18')

    visit '/spaces/new'
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :price, with: price
    fill_in :available_from, with: available_from
    fill_in :available_to, with: available_to
    click_button 'List my space'
  end
end
