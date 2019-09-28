class ContactMailer < ApplicationMailer
  default from: 'my_confidence@example.com'
  
  def contact_mail(contact)
    @contact = contact

    mail(to: @contact.user.email, subject: 'お問い合わせありがとうございます')
  end
end
