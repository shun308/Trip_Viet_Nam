class FavoriteConversationsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorite_conversations = FavoriteConversation.where(user_id: @user.id).all
    @search = Item.ransack(params[:q])
    @search2 = Conversation.ransack(params[:q])
  end
 
  def create
    @user_id = current_user.id
    @conversation_id = Conversation.find(params[:id]).id 
    @favorite_conversation = FavoriteConversation.new(conversation_id: @conversation_id, user_id: @user_id)
    if @favorite_conversation.save
      redirect_back(fallback_location: root_path)
    else
      #重複して保存しようとした場合
      flash[:notice] = "※登録済みです"
      redirect_back(fallback_location: root_path)
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite_conversation = FavoriteConversation.find(params[:id])
    if @favorite_conversation.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      flash[:notice] = "削除しました"
      redirect_back(fallback_location: root_path)
    end
  end
end
