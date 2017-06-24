class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_monthes, only: [:new, :edit], if: :devise_controller?
  before_action :set_years, only: [:new, :edit], if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

   def set_years
    @years = []
    i = 0
    while i < 9 do
      @years <<  Date.today.year + i
      i += 1
    end
    return @years
  end

  def set_monthes
    @monthes = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
  end

end
