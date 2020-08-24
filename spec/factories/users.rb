FactoryBot.define do
  factory :user do
    nickname { "テストユーザー" }
    email { "test_user@test.co.jp" }
    password { "123456789" }
    password_confirmation {"123456789"}
    # 認証メールで認証時に必要。例えばuser = create(:user)などの処理で必要。
    confirmed_at { Date.today }    
  end
end
