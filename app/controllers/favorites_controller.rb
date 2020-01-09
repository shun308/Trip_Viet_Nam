class FavoritesController < ApplicationController

  def create
    @user_id = current_user.id #ログインしたユーザのID
    @item_id = Item.find(params[:id]).id #特定のitemのID
    #item_idに@item_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
    @favorite = Favorite.new(item_id: @item_id, user_id: @user_id)
    if @favorite.save
      #保存に成功した場合、item一覧画面に戻る
      redirect_to item_path
    else
      #重複して保存しようとした場合
      redirect_to item_path
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to users_path
    end
  end
end
