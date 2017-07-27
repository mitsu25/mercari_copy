class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters  , if: :devise_controller?
  before_action :set_monthes, only: [:new, :edit], if: :devise_controller?
  before_action :set_years  , only: [:new, :edit], if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
   added_attrs = [:name, :family_name, :first_name, :family_name_kana, :first_name_kana,
                  :zip_code, :prefecture, :city, :house_number, :buildng, :telephone,
                  :campany, :number, :expire_year, :expire_month]
   devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
   devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
   devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
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
