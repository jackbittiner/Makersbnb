feature 'list a space' do

  scenario 'have the ability to list a space' do
    
    visit '/spaces'
    click_button 'List a Space'
    expect(page).to have_content 'List a Space'
  end

  scenario 'add a specific space' do
    sign_up
    create_listing

    expect(current_path).to eq '/spaces'

    within 'ul#spaces' do
      expect(page).to have_content 'Casa de Rodriguez'
    end
  end
end
