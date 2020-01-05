class UsersController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorites = Favorite.where("user_id = ?", @user)
    @items = Item.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end