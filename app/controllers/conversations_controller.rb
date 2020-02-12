class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.page(params[:page]).per(15)
  end

  def show
    @user = User.find(current_user.id)
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorite_conversations = FavoriteConversation.where("user_id = ?", @user)
  end
end
