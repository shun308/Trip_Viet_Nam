class NotesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @notes = Note.find_by(params[:id])
    @search = Note.ransack(params[:q]) #ransackメソッド推奨
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = "保存に成功しました"
      redirect_to notes_path
    else
      flash[:notice] = "※タイトルを入力してください"
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:title,:memo).merge(user_id: current_user.id)
    end
end
