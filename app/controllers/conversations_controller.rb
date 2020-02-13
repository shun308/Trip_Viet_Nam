class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.page(params[:page]).per(15)
    @search = Conversation.ransack(params[:q])
  end

  def show
    @search = Conversation.ransack(params[:q]) #ransackメソッド推奨
    @search_conversations = @search.result
  end
end
