FactoryBot.define do
  factory :auth_hash, class: OmniAuth::AuthHash do
    initialize_with do
      OmniAuth::AuthHash.new({
        provider: provider,
        uid: uid,
        info: {
          email: email,
          name: 'Ben',
          image: 'https://avatars.githubusercontent.com/u/43788107?v=4'
        }
      })
    end

    trait :github do
      provider { "github" }
      sequence(:uid)
      email { "test@gmail.com" }
    end
  end
end
