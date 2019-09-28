class ContactsController < ApplicationController
  before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver_now
      flash[:notice] = "お問い合わせ「#{@contact.title}」を作成しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :content)
  end
end
