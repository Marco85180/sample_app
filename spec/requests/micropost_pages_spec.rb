require 'rails_helper'

RSpec.describe "MicropostPages", :type => :request do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path}

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end

    describe "as incorrect user" do
    let(:other_user) { FactoryGirl.create(:user) }
      before do
        sign_in other_user
        visit root_path
      end
      it "should not delete a micropost" do
        expect(page).not_to have_link("delete")
      end
    end
  end

  describe "Pluralize and count microposts" do
    before do
      2.times { FactoryGirl.create(:micropost, user: user,
                                    content: "Lorem ipsum") }
      visit root_path
    end
    it "must show 2 microposts" do
      expect(page).to have_selector("span", text: "2 microposts")
    end
    describe "the page must show 1 micropost" do
      before { click_link "delete", match: :first }
      it "should be singular when count eq to 1" do
        expect(page).to have_selector("span", text: "1 micropost")
      end
    end
  end

  describe "creation of 31 microposts to show pagination" do
    before do
      31.times { FactoryGirl.create(:micropost, user: user,
                                    content: "Lorem ipsum") }
      visit root_path
    end
    it "must show a pagination" do
      expect(page).to have_selector("div.pagination")
    end
    after { user.microposts.destroy_all }
  end
end
