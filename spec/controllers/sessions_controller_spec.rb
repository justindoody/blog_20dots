describe SessionsController do
  describe 'GET new' do
    before { get :new }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'loads with new template' do
      expect(response).to render_template('new')
    end
  end

  describe 'POST login' do
    let!(:user) { User.create(password_digest: BCrypt::Password.create("password", cost: 4)) }

    context 'with correct password' do
      before { post :login, params: { session: { password: "password" } } }

      it 'redirects to admin path' do
        expect(response).to redirect_to(admin_posts_path)
      end

      it 'sets admin session' do
        expect(session[:admin]).to eq true
      end
    end

    context 'with wrong password' do
      it 'redirects back to login path' do
        post :login, params: { session: { password: "wrong" } }
        expect(response).to redirect_to(admin_sessions_path)
      end
    end

  end

  describe 'GET logout' do
    before { get :logout }

    it 'redirects to root' do
      expect(response).to redirect_to(root_path)
    end

    it 'clears out session user id' do
      expect(session[:user_id]).to be_nil
    end
  end

end