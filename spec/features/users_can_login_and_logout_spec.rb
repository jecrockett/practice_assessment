require 'rails_helper'

RSpec.feature "Authenticated user can sign out of their account" do
  it "redirects them to the login/signup page" do
    User.create(email: "jamie@crockett.com", password: "i like socks")

    visit login_path
    fill_in "Email", with: "jamie@crockett.com"
    fill_in "Password", with: "i like socks"
    click_button "Login"

    expect(current_path).to eq links_path

    click_on "Sign Out"

    expect(current_path).to eq root_path
    visit links_path
    expect(current_path).to eq root_path
  end
end
