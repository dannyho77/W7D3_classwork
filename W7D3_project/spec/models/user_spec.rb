require 'rails_helper'

RSpec.describe User, type: :model do 
  subject(:user){User.new(username: "Bob123", password_digest: "12312312", session_token: "sadsadasda")}

  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_uniqueness_of(:username)}
  end

  describe "associations" do
    it {should have_many(:goals)}
    it {should have_many(:comments)}
  end
end 
