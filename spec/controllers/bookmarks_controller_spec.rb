require 'rails_helper'
include UsersHelper

RSpec.describe BookmarksController, type: :controller do
  let(:my_topic) { create(:topic) }
  let(:my_user) { create(:user) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic, user: my_user)}

  context "guest user" do
    describe "GET show" do
      it "returns http success" do
        get :show, {topic_id: my_topic.id, id: my_bookmark.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, {topic_id: my_topic.id, id: my_bookmark.id}
        expect(response).to render_template :show
      end

      it "assigns my_bookmark to @bookmark" do
        get :show, {topic_id: my_topic.id, id: my_bookmark.id}
        expect(assigns(:bookmark)).to eq(my_bookmark)
      end
    end

    describe "GET new" do
      it "redirect to new_user_session_path" do
        get :new, topic_id: my_topic.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST create" do
      it "redirect to new_user_session_path" do
        post :create, topic_id: my_topic.id, bookmark: {url: Faker::Internet.url}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do
      it "redirect to new_user_session_path" do
        get :edit, {topic_id: my_topic.id, id: my_bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT update" do
      it "redirect to new_user_session_path" do
        new_url = Faker::Internet.url
        put :update, topic_id: my_topic.id, id: my_bookmark.id, bookmark: {url: new_url}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE destroy" do
      it "redirect to new_user_session_path" do
        delete :destroy, {topic_id: my_topic.id, id: my_bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
