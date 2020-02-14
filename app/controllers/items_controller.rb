class ItemsController < ApplicationController
  before_action :set_search, only: [:index, :edit, :show]
  before_action :set_user, only: [:index, :edit, :show]
  
  def index
  end

  def show
    #ページネーション
    @items = Item.page(params[:page]).per(15)
  end
  
  def edit
    @search_items = @search.result
  end

  private
    def set_search
      @search = Item.ransack(params[:q])
    end

    def set_user
      @user = User.find(current_user.id)
    end
end
