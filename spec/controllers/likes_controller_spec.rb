require 'rails_helper'
include UsersHelper

RSpec.describe LikesController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic, user: my_user) }

  context 'guest user' do
    describe 'POST create' do
      it 'redirects the user to sign in view' do
        post :create, { bookmark_id: my_bookmark.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE destroy' do
      it 'redirects the user to sign in view' do
        like = my_user.likes.where(bookmark: my_bookmark).create
        delete :destroy, { bookmark_id: my_bookmark.id, id: like.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'signed in user' do
    login_user

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    describe 'POST create' do
      it 'redirects to the bookmark show view' do
        post :create, {bookmark_id: my_bookmark.id}
        expect(response).to redirect_to([my_topic, my_bookmark])
      end

      it 'creates a like for the current user and specified bookmark' do
        # expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).to be_nil
        post :create, {bookmark_id: my_bookmark.id}
        expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).not_to be_nil
      end
    end
  end
end
