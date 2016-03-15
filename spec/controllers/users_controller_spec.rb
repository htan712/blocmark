require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:my_user) { create(:user)}

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: my_user.id
      expect(response).to have_http_status(:success)
    end
  end

end
