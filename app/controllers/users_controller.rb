class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)

    @user = User.create(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'

      session[:user_id] = @user.id
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'

      render :new
    end

  end
end
