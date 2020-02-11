class ItemsController < ApplicationController
  def index
    @search = Item.ransack(params[:q])
  end

  def show
    #ページネーション
    @items = Item.page(params[:page]).per(15)
  end

  def conversation
    @items = Item.page(params[:page]).per(15)
  end
end
