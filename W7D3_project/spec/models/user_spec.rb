require 'rails_helper'

subject(:user){User.new(username: "Bob123")}

describe "validations" do
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_uniqueness_of(:username)}
end

describe "associations" do
  it {should have_many(:goals)}
  it {should have_many(:comments)}
end