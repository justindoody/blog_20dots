describe Post do
  it '.create_default' do
    post = build :default_post
    expect(Post.create_default).to be_instance_of(Post)
    expect(Post.create_default.title).to eq post.title
    expect(Post.create_default.post).to eq post.post
  end

  it '#publish' do
    post = build :default_post
    expect(post.draft).to be true
    post.publish
    expect(post.draft).to be false
  end

  it '#unpublish' do
    post = build(:default_post, draft: false)
    expect(post.draft).to be false
    post.unpublish
    expect(post.draft).to be true
  end

  it '#update_since_published?' do
    post = create(:post_one)
    expect(post.updated_since_published?).to be true
  end

end