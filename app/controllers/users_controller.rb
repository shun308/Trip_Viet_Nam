class UsersController < ApplicationController

  def show
    @search = Note.ransack(params[:q]) #ransackメソッド推奨
    @search_notes = @search.result
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