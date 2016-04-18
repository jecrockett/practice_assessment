require 'rails_helper'

RSpec.feature "Unregistered users can create a new account" do
  scenario "they fill out all required fields" do
    email = "jamie@crockett.com"
    password = "i like socks"

    visit root_path
    click_on 'Sign Up'

    expect(page).to have_content "Create a New Account"

    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Create Account"

    expect(page).to have_content "Account created!"
    expect(User.last.email).to eq email
  end
end
