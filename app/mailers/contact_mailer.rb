class ContactMailer < ApplicationMailer
  default to: 'hideakisuda.5800@gmail.com' # 送信先アドレス
  def send_mail(contact)
    @contact = contact
    mail(subject: 'webサイトよりメッセージが届きました') do |format|
      format.text
    end
  end
end
