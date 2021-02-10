describe PostsController do
  let(:login) { allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true) }

  before(:each) do
    @post1 = Post.create( title: 'A New Post',
                          post: 'Start typing...',
                          draft: false,
                          published_at: Time.now)

    @post2 = Post.create( title: 'A Second Post',
                          post: 'Short article.',
                          draft: true)
  end

  describe 'GET index' do
    context 'when public' do
      before :each do
        get :index
      end

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end

      it 'loads all published posts into @posts' do
        Post.create(title: 'A Second New Post', post: 'Start typing...')
        expect(assigns(:posts)).to match_array([@post1])
      end
    end

    context 'when admin' do
      it 'redirects to admin path' do
        login
        get :index
        expect(response).to redirect_to(admin_posts_path)
      end
    end
  end

  describe 'GET show' do
    before :each do
      get :show, params: { id: @post1.slug }
    end

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'has a false updated_since_published flag' do
      expect(assigns(:updated_since_published)).to eq false
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    context 'when admin' do
      before(:each){ login; get :new }

      it 'has a 302 status code' do
        expect(response.status).to eq(302)
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_url)
      end

      it 'creates a new post' do
        expect(Post.count).to eq(3)
      end
    end

    context 'when public' do
      it 'has a 302 status code' do
        get :new
        expect(response.status).to eq(302)
      end

      it 'redirects to login url' do
        get :new
        expect(response).to redirect_to(admin_sessions_url)
      end
    end
  end


  describe 'GET admin' do
    context 'when public' do
      it 'has a 302 status code' do
        get :admin
        expect(response.status).to eq(302)
      end

      it 'redirects to admin_sessions_url' do
        get :admin
        expect(response).to redirect_to(admin_sessions_url)
      end
    end

    context 'when admin' do
      before(:each){ login; get :admin }

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders the admin template' do
        expect(response).to render_template('admin')
      end

      it 'loads all published posts into @posts' do
        expect(assigns(:posts)).to match_array([@post1, @post2])
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when admin' do
      before(:each){ login; delete :destroy, params: { id: @post1.id } }

      it 'deletes the post' do
        expect{Post.find(@post1.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'redirects to root url' do
        expect(response).to redirect_to(root_url)
      end
    end

    context 'when public' do
      it 'redirects to login url' do
        delete :destroy, params: { id: @post1.slug }
        expect(response).to redirect_to(admin_sessions_url)
      end
    end
  end

  describe 'GET edit' do
    context 'when public' do
      it 'redirects to login url' do
        get :edit, params: { id: @post1.id }
        expect(response).to redirect_to(admin_sessions_url)
      end
    end

    context 'when admin' do
      before(:each){ login; get :edit, params: { id: @post1.id } }

      it 'has a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'PUT update' do
    context 'when public' do
      before(:each){ post :update, params: { id: @post2.id } }

      it 'redirects to login url' do
        expect(response).to redirect_to(admin_sessions_url)
      end
    end

    context 'when admin' do
      before(:each) do
        login
        post :update, params: { id: @post2.id, post: {title: "Such Post", post: "Really good."} }
      end

      it 'sets a new title' do
        expect(assigns(:post).title).to eq "Such Post"
      end

      it 'sets a new friendly id' do
        expect(assigns(:post).slug).to eq "such-post"
      end

      it 'updates the body content' do
        expect(assigns(:post).post).to eq "Really good."
      end

      it 'redirects back to edit post url' do
        expect(response).to redirect_to(edit_post_path(@post2.id))
      end
    end
  end

  # I realize publish and unpublish should be posts not gets
  describe 'GET publish' do
    context 'when public' do
      before(:each){ get :publish, params: { id: @post2.id } }

      it 'redirects to login url' do
        expect(response).to redirect_to(admin_sessions_url)
      end
    end

    context 'when admin' do
      before(:each){ login; get :publish, params: { id: @post2.id } }

      it 'redirects back to edit post url' do
        expect(response).to redirect_to(edit_post_path(@post2.id))
      end

      it 'updates draft to false' do
        expect(assigns(:post).draft).to eq false
      end

      it 'updates published time' do
        expect(assigns(:post).published_at).not_to be_nil
      end
    end
  end

  describe 'GET unpublish' do
    context 'when public' do
      before(:each){ get :unpublish, params: { id: @post1.id } }

      it 'redirects to login url' do
        expect(response).to redirect_to(admin_sessions_url)
      end
    end

    context 'when admin' do
      before(:each){ login; get :unpublish, params: { id: @post1.id } }

      it 'redirects back to edit post url' do
        expect(response).to redirect_to(edit_post_path(@post1.id))
      end

      it 'updates draft to true' do
        expect(assigns(:post).draft).to eq true
      end
    end
  end

end
