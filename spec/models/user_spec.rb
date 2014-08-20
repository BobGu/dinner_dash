require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) do
    User.create(:full_name => "George Brett",
                :email => "brett@example.com",
                :display_name => "Baseball Badass Brett",
                :role => "Customer",
                :password => 'password'
                )
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

  it 'is invalid if email is not formatted correctly' do
    user.email = "abcgmail.com"
    expect(user).not_to be_valid
  end

  it 'is invalid if the email already exists' do
    2.times do
      User.create(:full_name => "Babe Ruth",
                  :email => "bambino@example.com",
                  :display_name => "The Great Bambino",
                  :role => "Customer",
                  :password => 'password'
                  )
    end
    result = User.where(email: 'bambino@example.com')
    assert_equal 1, result.count
  end
end
