class ItemsController < ApplicationController
  before_action :set_all, only: [:index, :edit, :show]
  
  def index
    @search_items = @search.result(distinct: true)
    @check = params[:q]
  end

  def show
    @items = Item.page(params[:page]).per(15)
  end
  
  def edit
    @search_items = @search.result(distinct: true)
  end

  private
    def set_all
      @user = User.find(current_user.id)
      @search = Item.ransack(params[:q])
      @search2 = Conversation.ransack(params[:q])
    end
  end