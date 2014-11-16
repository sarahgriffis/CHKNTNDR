class MessagesController < ApplicationController

  before_filter :set_user
  before_action :authenticate_user!
  def new
    @message = Message.new
    @message.receiver_id = params[:receiver_id]
    @message.reservation_id = params[:reservation_id]

    if params[:reply_to]
      @reply_to = User.find_by_user_id(params[:reply_to])
      unless @reply_to.nil?
        @message.receiver_id = @reply_to.user_id
      end
    end
  end

  def create
    #@message = Message.new(params[:message])
    @message = Message.new(message_params)

    @message.sender_id = current_user.id

    if @message.save
      flash[:notice] = "Your message has been sent!"
      redirect_to find_matches_path(Reservation.find(@message.reservation_id))
    else
      render :action => :new
    end
  end


  def index
   if params[:mailbox] == "sent"
     @messages = @user.sent_messages
   elsif params[:mailbox] == "inbox"
     @messages = @user.received_messages
   #elsif params[:mailbox] == "archieved"
    # @messages = @user.archived_messages
   end
  end

  def show
    @message = Message.readingmessage(params[:id],@user.user_id)
  end

  def delete_multiple
    if params[:delete]
      params[:delete].each { |id|
        @message = Message.find(id)
        @message.mark_message_deleted(@message.id,@user.user_id) unless @message.nil?
        }
      flash[:notice] = "Messages deleted"
    end
    redirect_to user_messages_path(@user, @messages)
  end

  private
  def set_user
   @user = current_user
  end


  def message_params
    params.require(:message).permit(:body, :subject, :sender_id, :receiver_id, :read_at, :deleted, :reservation_id)
  end


end


