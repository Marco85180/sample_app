require 'rails_helper'

RSpec.describe "Authentication", :type => :request do
  describe "authorization" do
    let(:user) { FactoryGirl.create(:user) }

    describe "submitting to the update action" do
      before { patch user_path(user) }
      specify { expect(response).to redirect_to(signin_path)}
    end

    describe "in the Microposts controller" do
      describe "submitting to the create action" do
        before { post microposts_path }
        specify { expect(response).to redirect_to(signin_path)}
      end
      describe "submitting to the destroy action" do
        before { delete micropost_path(FactoryGirl.create(:micropost)) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }

      describe "submitting a GET request to the User#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match(titre('Edit user')) }
        specify { expect(response).to redirect_to(root_url) }
      end
      describe "submitting a PATCH request to the Users#update action" do
        before {patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin, no_capybara: true }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
    describe "as signed-in user " do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user, no_capybara: true }

      describe "cannot access #new action" do
        before { get new_user_path }
        specify { expect(response).to redirect_to(root_path) }
      end

      describe "cannot access #create action" do
        before { post users_path, user: user.attributes }
        specify { expect(response).to redirect_to(root_path) }
      end
    end

    describe "as admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      before { sign_in admin, no_capybara: true }

      describe "should not be able to delete themselves via #destroy action" do
        specify do
          expect { delete user_path(admin) }.to change(User, :count).by(0)
        end
      end
    end
  end
end