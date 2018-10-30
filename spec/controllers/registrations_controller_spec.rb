require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "Get #index" do
      it 'renders the :index template' do
          get :index
          expect(response).to render_template :index
      end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it "saves the new user in the database" do
      expect do
        post :create, params: {user: attributes_for(:user)}
      end.to change(User, :count).by(1)
    end
  end
end
