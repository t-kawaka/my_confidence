class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      @conversation = Conversation.find(params[:conversation_id])
      @messages = @conversation.messages
      # flash[:notice] = "メッセージが入力されていません"
      redirect_to conversation_messages_path(@conversation), notice: "メッセージが入力されていません"
      # render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
