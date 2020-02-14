class ConversationsController < ApplicationController
  before_action :set_search, only: [:index, :show]
  before_action :set_user, only: [:index, :show]
  before_action :set_search2, only: [:index, :show]

  def index
    @conversations = Conversation.page(params[:page]).per(15)
  end

  def show
    @search_conversations = @search2.result
  end

  private
    def set_search2
      @search2 = Conversation.ransack(params[:q])
    end

    def set_search
      @search = Item.ransack(params[:q])
    end

    def set_user
      @user = User.find(current_user.id)
    end
end