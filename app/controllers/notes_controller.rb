class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :show, :update,:destroy]
  before_action :set_user, only: [:index, :new, :edit, :show,:create,:update]
  before_action :set_search, only: [:index, :new, :edit, :show,:create,:update]
  
  def index
    @notes = Note.find_by(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path
    else
      flash[:notice] = "※タイトルを入力してください"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @note.update(note_params)
       redirect_to note_path
    else
      flash[:notice] = "※タイトルを入力してください"
      render :edit
    end
  end

  def destroy
    if @note.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      flash[:notice] = "削除しました"
      redirect_to notes_path
    end
  end

  private
    def note_params
      params.require(:note).permit(:title,:memo).merge(user_id: current_user.id)
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def set_search
      @search = Item.ransack(params[:q])
    end
end