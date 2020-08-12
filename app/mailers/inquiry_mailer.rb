class InquiryMailer < ApplicationMailer
  default from: "kagerawlab@gmail.com"   # 送信元アドレス
  default to: "kagerawlab@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => "お問い合わせを承りました")
  end

  def maketag_email(item)
    @item = item
    @url = "https://www.kage-raw.com//items/#{@item.id}/management"
    mail(:subject => "タグが投稿されました")
  end

  def registration_email
    mail(:subject => "新規登録がありました")
  end

  def request_occured_email
    mail(:subject => "リクエストがありました")
  end

  def request_accepted_email(user)
    @user = user
    mail(
      subject: "【カゲローラボです！】リクエストを承りました",
      to: @user.email,
    )
  end

  def status_cheanged_email(user)
    @user = user
    mail(
      subject: "【カゲローラボです！】ステータスが変更されました",
      to: @user.email,
    )
  end
end
