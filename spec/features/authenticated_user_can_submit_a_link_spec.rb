require 'rails_helper'

RSpec.feature "User submits a link" do
  scenario "submission has all required fields" do
    url = "http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg"
    login_user

    expect(current_path).to eq links_path
    within '#new-link-form' do
      expect(page).to have_content "Title"
      expect(page).to have_content "Url"
    end

    fill_in "Title", with: "Dog"
    fill_in "Url", with: url
    click_on "Submit"

    within '#links-container' do
      expect(page).to have_content "Dog"
      expect(page).to have_content url
      expect(page).to have_content "Read: false"
    end
  end

  context "submission is missing a field" do
    xit "throws an error that a field is missing" do
      url = "http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg"
      login_user

      expect(current_path).to eq links_path
      within '#new-link-form' do
        expect(page).to have_content "Title"
        expect(page).to have_content "Url"
      end

      fill_in "Url", with: url
      click_on "Submit"

      expect(page).to have_content "Missing fields or invalid URL."
    end
  end

  context "submission has an invalid link" do
    xit "throws an error that the link is invalid" do

    end
  end

end
