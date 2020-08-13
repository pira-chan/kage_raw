class InquiriesController < ApplicationController
  def new # お問い合わせ入力画面
    @inquiry = Inquiry.new
    
  end

  def confirm # お問い合わせ入力の確認
    @inquiry = Inquiry.new(inquiries__params)
    render :action => "new" unless @inquiry.valid?
  end

  def thanks # お問い合わせ完了後画面
    @inquiry = Inquiry.new(inquiries__params)
    InquiryMailer.received_email(@inquiry).deliver
  end

  private

  def inquiries__params
    params.require(:inquiry).permit(:email, :message, :name)
  end
end
