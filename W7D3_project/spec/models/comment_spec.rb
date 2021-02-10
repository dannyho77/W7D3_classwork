require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment){Comment.new(body: "hello my name is richard", author_id: 1, goal_id: 1)}

  describe "validations" do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:author_id)}
    it {should validate_presence_of(:goal_id)}
  end

  describe "associations" do
    it {should belong_to(:goal)}
    it {should belong_to(:author)}
  end

  
end
