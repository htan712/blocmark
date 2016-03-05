require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_topic) { create(:topic) }

  context "guest" do
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Topic.all to @topics" do
        get :index
        expect(assigns(:topics)).to eq([my_topic])
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, {id: my_topic.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, {id: my_topic.id}
        expect(response).to render_template :show
      end

      it "assigns my_topic to @topic" do
        get :show, {id: my_topic.id}
        expect(assigns(:topic)).to eq(my_topic)
      end
    end

    describe "GET new" do
      it "redirect to new_user_session_path" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "POST create" do
      it "redirect to new_user_session_path" do
        post :create, {topic: {title: Faker::Hipster.sentence}}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do
      it "redirect to new_user_session_path" do
        get :edit, {id: my_topic.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "PUT update" do
      it "redirect to new_user_session_path" do
        new_title = Faker::Hipster.sentence
        put :update, id: my_topic.id, topic: {title: new_title}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE destroy" do
      it "redirect to new_user_session_path" do
        delete :destroy, {id: my_topic.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


end
