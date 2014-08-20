require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) do
    User.create(:full_name => "john doe",
    :email => "john_doe@example.com",
    :display_name => "john_doe_123",
    :role => "admin",
    :password => 'password')
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a full_name' do
    user.full_name = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without a role' do
    user.role = nil
    expect(user).not_to be_valid
  end

  it 'is invalid if the email already exists' do
    2.times do
      User.create(:full_name => "john doe",
                  :email => "john_doe@example.com",
                  :display_name => "john_doe_123",
                  :role => "admin",
                  :password => 'password')
    end
    result = User.where(email: 'john_doe@example.com')
    assert_equal 1, result.count
  end

  it "authenticates a user via password" do
    original_user = user
    authenticated_user = User.authenticate(:email => "john_doe@example.com",
                                           :password => "password")

    assert_equal original_user, authenticated_user
  end
end
