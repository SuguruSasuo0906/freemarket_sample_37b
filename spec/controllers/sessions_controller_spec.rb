require 'rails_helper'

RSpec.describe Devise::SessionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    describe 'GET #new' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      before do
        @user = FactoryGirl.create(:user, password: "password", email: "customer@example.com", password_confirmation: "password")
      end
      it 'success process after login' do
        post :create, params: {user: {password: "password", email: "customer@example.com"}}
        expect(controller.user_signed_in?).to be true
        expect(controller.current_user.email).to eq "customer@example.com"
      end
    end

    describe "DELETE #destroy" do
      before do
        @user = FactoryGirl.create(:user)
      end
      it 'success process after logout' do
        delete :destroy, params: {user: attributes_for(:user)}
        expect(controller.user_signed_in?).to be false
      end
    end
end
