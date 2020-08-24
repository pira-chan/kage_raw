require "rails_helper"

RSpec.describe User, type: :model do
  example "nickname、email、passwordが存在すれば登録できること" do
     user = build(:user)
     expect(user).to be_valid
  end

  example "nicknameがない場合は登録できないこと" do
    user = build(:user, nickname: "")
    user.valid?
    expect(user.errors[:nickname]).to include("ニックネームを入力してください")
  end
   
  example "emailがない場合は登録できないこと" do
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end

  example "passwordがない場合は登録できないこと" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("が入力されていません。")
  end

  
  example "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("が一致しておりません。")
  end
  # ニックネームはフォーム自体にmaxlength
  # example "nicknameが13文字以上であれば登録できないこと" do
  #   user = build(:user, nickname: "1234567891234")
  #   user.valid?
  #   expect(user.errors[:nickname]).not_to be_valid
  # end

  # # # 7
  # # example "nicknameが6文字以下であれば登録できること" do
  # #   user = build(:user, nickname: "123456")
  # #   user.valid?
  # #   expect(user).to be_valid
  # # end

  example "重複したemailが存在する場合登録できないこと" do
    user = create(:user)
    another_user = build(:user)
    another_user.valid?
    expect(another_user.errors[:email]).to include("は既に使用されています。")
  end

  example "passwordが8文字以上であれば登録できること" do
    user = build(:user, password: "12345678", password_confirmation: "12345678")
    user.valid?
    expect(user).to be_valid
  end

  example "passwordが7文字以下である場合は登録できないこと" do
    user = build(:user, password: "1234567", password_confirmation: "1234567")
    user.valid?
    expect(user.errors[:password]).to include("は8文字以上に設定して下さい。")
  end

end
