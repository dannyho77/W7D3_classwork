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

  describe "session_token" do
    it "should assign a unique session token to a current user, if there is none currently" do
      expect(FactoryBot.create(:user).session_token).not_to be_nil
    end
  end

  describe "check_password?(password)" do
    let!(:user) {create(:user)}
    context "where password is valid" do
      it "should return true" do
        expect(user.check_password?("starwars")).to be true
      end
    end
    context "where password is invalid" do
      it "should return false" do
        expect(user.check_password?("random")).to be false
      end
    end
  end
end 
