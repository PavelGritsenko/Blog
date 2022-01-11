# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound # обработка ошибки ActiveRecord::RecordNotFound в методе notfound

    private

    def notfound(exception)
      logger.warn exception # записываем в журнал событий ошибку(необязательно)
      render file: 'public/404.html', status: :not_found, layout: false # отрисовка страницы 404, код состояния notfound
    end
  end
end
