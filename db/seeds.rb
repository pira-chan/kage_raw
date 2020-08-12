require "csv"

User.create!(nickname: "テストユーザー",
             email: "test@test.com",
             password: "12345678",
             password_confirmation: "12345678")
