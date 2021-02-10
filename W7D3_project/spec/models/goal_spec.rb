require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal){Goal.new(body: "hello my name is duncan", author_id: 1)}
  describe "validations" do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:author_id)}
  end

  describe "associations" do
    it {should belong_to(:author)}
    it {should have_many(:comments)}
  end
end
