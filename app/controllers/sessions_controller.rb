# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]

  def new; end

  def create
    user = User.find_by email: params[:email] # находим пользователя по мейлу

    if user&.authenticate(params[:password])
      # метод authenticate добавляется из-за has_secure_password в модели user,
      # он преобразует пароль в хеш и сверяет его с тем что есть в бд.
      # Но есть момент что строка может вернуть nill, если не правильно ввести мейл,
      # для этого  ставим & после user и в случае nill сразу переходим в ветку else

      sign_in user                                # пускаем юзера на сайт с помощью сесси
      redirect_to root_path
    else
      render :new                                 # отрисовываем заново форму для входа
    end
  end

  def destroy
    sign_out                # метод удаления сесси в модуле Authenticate
    redirect_to root_path   # перенаправление на главную страницу
  end
end
