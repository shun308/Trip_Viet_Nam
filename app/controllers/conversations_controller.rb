class ConversationsController < ApplicationController
  before_action :set_all2, only: [:index, :show, :edit]

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
    def set_all2
      @user = User.find(current_user.id)
      @search = Item.ransack(params[:q])
      @search2 = Conversation.ransack(params[:q])
    end
  end