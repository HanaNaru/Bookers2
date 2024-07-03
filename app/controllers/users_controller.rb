class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
    @profile_image = @user.profile_image
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all

  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

 def is_matching_login_user
    @user = User.find(params[:id])
   unless user.id == current_user.id
    redirect_to user_path(current_user.id)
   end
 end
end