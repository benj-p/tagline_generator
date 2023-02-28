require 'rails_helper'

RSpec.describe "AuthenticatesUsers", type: :system do
  before(:each) { OmniAuth.config.mock_auth[:github] = nil }

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, FactoryBot.create(:auth_hash, :github))
  end

  it "allows authentication with Github" do
    visit '/users/auth/github/callback'
    visit '/'

    expect(page).to have_content('Sign out')
  end
end
