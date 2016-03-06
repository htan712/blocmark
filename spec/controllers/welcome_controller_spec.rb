require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to render_template('about')
    end
  end
end
