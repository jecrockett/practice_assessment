require 'rails_helper'

RSpec.feature "Editing links" do
  context "User marks link as read" do
    it "updates the link via ajax" do
      login_user
      add_link_one

      within '#links-container' do
        expect(page).to have_content "Aardvark"
      end
    end
  end
end
