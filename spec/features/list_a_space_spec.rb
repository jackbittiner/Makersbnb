feature 'list a space' do

  scenario 'have the ability to list a space' do
    # sign_up
    # sign_in
    visit '/spaces'
    click_button 'List a Space'
    expect(page).to have_content 'List a Space'
  end

  scenario 'add a specific space' do
    #sign_in
    create_listing

    expect(current_path).to eq '/spaces'

    within 'ul#spaces' do
      expect(page).to have_content 'Casa de Rodriguez'
    end
  end
end
