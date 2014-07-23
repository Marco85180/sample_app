require 'rails_helper'

describe ApplicationHelper do

  describe "titre" do
    it "should include the page title" do
      expect(titre("foo")).to match(/foo/)
    end

    it "should include the base title" do
      expect(titre("foo")).to match(/^Ruby on Rails Tutorial Sample App/)
    end

    it "should not include a bar for the home page" do
      expect(titre("")).not_to match(/\|/)
    end
  end
end