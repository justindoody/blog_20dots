FactoryBot.define do
  factory :post_one, class: Post do
    title { "Factory Article" }
    post  { "Just a bit of text." }
    draft { false }
    published_at { 24.hours.ago }
  end

  factory :default_post, class: Post do
    title { "A New Post" }
    post { "Start typing..." }
  end

  factory :admin, class: User do
    password_digest { BCrypt::Password.create("password", cost: 4) }
  end
end
