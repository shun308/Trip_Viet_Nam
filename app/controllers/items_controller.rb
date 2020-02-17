class ItemsController < ApplicationController
  before_action :set_search, only: [:index, :edit, :show]
  before_action :set_search2, only: [:index, :edit, :show]
  before_action :set_user, only: [:index, :edit, :show]
  
  def index
    @search_items = @search.result(distinct: true)
    @check = params[:q]
  end

  def show
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorites = Favorite.where(user_id: @user.id).all
    #ページネーション
    @items = Item.page(params[:page]).per(15)
  end
  
  def edit
    @search_items = @search.result(distinct: true)
  end

  private
    def set_search
      @search = Item.ransack(params[:q])
    end

    def set_search2
      @search2 = Conversation.ransack(params[:q])
    end

    def set_user
      @user = User.find(current_user.id)
    end
end
