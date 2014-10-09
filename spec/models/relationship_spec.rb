require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) {follower.relationships.build(followed_id: followed.id)}

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

  describe "when followed_id is nil" do
    before { relationship.followed_id = nil }
    it { should_not be_valid}
  end

  describe "when follower_id is nil" do
    before { relationship.follower_id = nil }
    it { should_not be_valid}
  end
end
