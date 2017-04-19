feature 'Viewing spaces' do

  scenario 'View all existing spaces' do
    sign_up
    create_listing
    expect(page.status_code).to eq 200
    within "ul#spaces" do
      expect(page).to have_content 'Casa de Rodriguez'
    end
  end

end
