class UsersController < ApplicationController
  before_action :set_user, only: %i[update edit destroy show]
  before_action :autorize_user, only: %i[edit update destroy]

  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'

      session[:user_id] = @user.id
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'

      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Данные пользователя обновлены!'

      session[:user_id] = @user.id
    else
      flash.now[:alert] = 'При попытке сохранить пользователя возникли ошибки'

      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'Пользователь удален'
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @question = Question.new(user: @user)
  end

  private

  def autorize_user
    redirect_with_alert unless current_user == @user
  end

  def set_user
    @user = User.find_by(nickname: params[:nickname])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :navbar_color)
  end
end
