class ConversationsController < ApplicationController
  before_action :set_search, only: [:index, :show,:edit]
  before_action :set_user, only: [:index, :show,:edit]
  before_action :set_search2, only: [:index, :show,:edit]

  def index
    @conversations = Conversation.page(params[:page]).per(15)
  end

  def show
    @search_conversations = @search2.result(distinct: true)
  end

  def edit
    @notes = Note.tagged_with(params[:tag_name])
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