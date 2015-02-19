 require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'GET new' do
    before { get :new }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'loads with new template' do
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    before do 
      @user = Users.create(password_digest: BCrypt::Password.create("password", cost: 4))
    end

    context 'with correct password' do
      before { post :create, session: { password: "password" } }

      it 'redirects to admin path' do
        expect(response).to redirect_to(admin_path)
      end

      it 'sets session user id' do
        expect(session[:user_id]).to eq @user.id
      end
    end

    context 'with wrong password' do
      it 'redirects back to login path' do
        post :create, session: { password: "wrong" }
        expect(response).to redirect_to(login_path)
      end
    end

  end

  describe 'DELETE destroy' do
    before { delete :destroy }

    it 'redirects to root' do
      expect(response).to redirect_to(root_path)
    end

    it 'clears out session user id' do
      expect(session[:user_id]).to be_nil
    end
  end

end