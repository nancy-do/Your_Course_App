class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Message successfully sent"
      if logged_in?
        redirect_to messages_index_url
      else
        redirect_to root_path
      end
    else
      message = "" 
      @message.errors.full_messages.each do |msg|
        message += msg+", "
      end
      flash[:danger] = message
      
      if logged_in?
        redirect_to messages_index_url
      else
        redirect_to root_path
      end
    end
  end 

  def index
    @messages = Message.all
  end
  
  private
    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
end
