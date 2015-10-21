require 'rails_helper'

RSpec.describe "PasswordTests", type: :request do
  it 'emails user when requesting password reset' do
    user = Factory(:user)
    visit login_path
    click_link 'password'
    fill_in 'Email', :with => user.email
  end
end
