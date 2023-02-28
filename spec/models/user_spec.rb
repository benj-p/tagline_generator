require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with an email and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid if password does not have 8 or more characters" do
    user = FactoryBot.build(:user, password: 'AB12abc')
    user.valid?
    expect(user.errors[:password]).to include("must be 8 or more characters, including lower and upper case letters and at least one number")
  end

  it "is invalid if password does not include a digit" do
    user = FactoryBot.build(:user, password: 'ABCDabcd')
    user.valid?
    expect(user.errors[:password]).to include("must be 8 or more characters, including lower and upper case letters and at least one number")
  end

  it "is invalid if password does not include a lowercase letter" do
    user = FactoryBot.build(:user, password: 'ABCD1234')
    user.valid?
    expect(user.errors[:password]).to include("must be 8 or more characters, including lower and upper case letters and at least one number")
  end

  it "is invalid if password does not include an uppercase letter" do
    user = FactoryBot.build(:user, password: 'abcd1234')
    user.valid?
    expect(user.errors[:password]).to include("must be 8 or more characters, including lower and upper case letters and at least one number")
  end

  it "is invalid with a duplicate email address" do
    user = FactoryBot.create(:user)
    user_2 = FactoryBot.build(:user, email: user.email)
    user_2.valid?
    expect(user_2.errors[:email]).to include("has already been taken")
  end
end
