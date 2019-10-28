class InquiryMailer < ApplicationMailer
    
  default from: "tgif.must@gmail.com"   # 送信元アドレス
  default to: "tgif.must@gmail.com"     # 送信先アドレス
    
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
    
end
