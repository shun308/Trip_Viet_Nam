class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @items = Item.all
    #ページネーション
    @items = Item.page(params[:page]).per(15)
  end

  def conversation
  end
end
