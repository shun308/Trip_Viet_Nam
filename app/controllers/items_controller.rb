class ItemsController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
  end

  def show
    #ページネーション
    @items = Item.page(params[:page]).per(15)
  end
  
  def edit
    @search = Item.ransack(params[:q]) #ransackメソッド推奨
    @search_items = @search.result
  end
end
