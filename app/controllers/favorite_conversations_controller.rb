class FavoriteConversationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorite_conversations = FavoriteConversation.where("user_id = ?", @user)
  end
 
  def create
    @user_id = current_user.id
    @conversation_id = Conversation.find(params[:id]).id 
    @favorite_conversations = FavoriteConversation.new(conversation_id: @conversation_id, user_id: @user_id)
    if @favorite_conversations.save
      flash[:notice] = "登録しました！"
      redirect_back(fallback_location: conversation_path)
    else
      #重複して保存しようとした場合
      flash[:notice] = "※登録済みです"
      redirect_back(fallback_location: conversation_path)
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite_conversations = FavoriteConversation.find(params[:id])
    if @favorite_conversations.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      flash[:notice] = "削除しました"
      redirect_to favorite_conversations_path
    end
  end
end
