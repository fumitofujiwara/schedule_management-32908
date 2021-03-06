class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #インターネット参照 編集した時にログアウト状態になるため記載。
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:department_id, :position, :email, :password, :password_confirmation)
  end
end
