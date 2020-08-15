class InquiryMailer < ApplicationMailer
  default from: "kagerawlab@gmail.com"
  default to: "kagerawlab@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => "お問い合わせを承りました")
  end

  def maketag_email(item)
    @selected_item = item
    @url = "https://www.kage-raw.com//items/#{@selected_item.id}/management"
    mail(:subject => "タグが投稿されました。")
  end

  def registration_email
    mail(:subject => "新規登録がありました")
  end

  def request_occured_email
    mail(:subject => "リクエストがありました")
  end

  def request_accepted_email(user)
    @user = user
    @url = "https://www.kage-raw.com/"
    mail(
      subject: "【カゲローラボです！】リクエストを承りました",
      to: @user.email,
    )
  end

  def status_cheanged_email(user)
    @user = user
    @url = "https://www.kage-raw.com/"
    mail(
      subject: "【カゲローラボです！】ステータスが変更されました",
      to: @user.email,
    )
  end
end
