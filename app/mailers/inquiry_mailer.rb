class InquiryMailer < ApplicationMailer
    
  default from: "kagerawlab@gmail.com"   # 送信元アドレス
  default to: "kagerawlab@gmail.com"     # 送信先アドレス
    
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
  
  def maketag_email(item)
    @item = item
    mail(:subject => 'タグが投稿されました')
  end
    
end
