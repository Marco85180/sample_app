require 'rails_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on rails Tutorial Sample App |" }

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should have the custom title" do
      visit '/static_pages/home'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "| Home")
    end

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_selector('h1', :text => 'Help')
    end

    it "should have the base title" do
      visit '/static_pages/help'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should have the custom title" do
      visit '/static_pages/help'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "| Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_selector('h1', :text => 'About Us')
    end

    it "should have the base title" do
      visit '/static_pages/about'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should have the custom title" do
      visit '/static_pages/about'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "| About Us")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_selector('h1', :text => 'Contact')
    end

    it "should have the base title" do
      visit '/static_pages/contact'
      expect(page).to have_selector('title',
        :visible => false,
        :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should have the custom title" do
      visit '/static_pages/contact'
      expect(page).to have_selector('title',
      :visible => false,
      :text => "| Contact")
    end
  end
end