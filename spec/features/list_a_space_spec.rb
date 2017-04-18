feature 'list a space' do

  scenario 'have the ability to list a space' do
    # sign_up
    # sign_in
    visit '/spaces/new'
    expect(page).to have_content 'List a space'
  end

  scenario 'add a specific space' do
    #sign_in
    visit '/spaces/new'
    fill_in 'name', with: 'Casa de Rodriguez'
    fill_in 'description', with: 'Lovely abode with stunning vistas to the Valencian coast'
    fill_in 'price', with: '500'
    fill_in 'available_from', with: '18/04/17'
    fill_in 'available_to', with: '18/04/18'
    click_button 'List my space'

    expect(current_path).to eq '/spaces'

    within 'ul#spaces' do
      expect(page).to have_content 'Casa de Rodriguez'
    end
  end
end