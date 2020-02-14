class FavoritesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorites = Favorite.where("user_id = ?", @user)
    @search = Item.ransack(params[:q])
  end
  
  def create
    @user_id = current_user.id #ログインしたユーザのID
    @item_id = Item.find(params[:id]).id #特定のitemのID
    #item_idに@item_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
    @favorite = Favorite.new(item_id: @item_id, user_id: @user_id)
    if @favorite.save
      #保存に成功した場合、item一覧画面に戻る
      redirect_back(fallback_location: item_path)
    else
      #重複して保存しようとした場合
      flash[:notice] = "※登録済みです"
      redirect_back(fallback_location: item_path)
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      flash[:notice] = "削除しました"
      redirect_to favorites_path
    end
  end
end