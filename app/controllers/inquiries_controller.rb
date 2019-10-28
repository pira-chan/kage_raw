class InquiriesController < ApplicationController
    
    
  def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    render :action => 'index'
  end
 
  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiries__params)
    if @inquiry.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end
 
  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiries__params)
    InquiryMailer.received_email(@inquiry).deliver
 
    # 完了画面を表示
    render :action => 'thanks'
  end
  
  private
  
  def inquiries__params
    params.require(:inquiry).permit(:email, :message, :name)
  end
  
end
