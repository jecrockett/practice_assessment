require 'rails_helper'

RSpec.feature "Unregistered user visits the root" do
  it "prompts them to login or sign up" do
    visit root_path

    expect(page).to have_content "Log In"
    expect(page).to have_content "Sign Up"
  end
end
