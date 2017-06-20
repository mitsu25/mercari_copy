class AddressesController < ApplicationController

  def new
    @address = Address.new
    @user    = current_user
  end

  def create
    @address = Address.new(address_params)
  end

  private
  def method_name
    params.require(:address).permit(:user_id, :family_name, :first_name, :family_name_kana, :first_name_kana, :zip_code, :prefecture, :city, :town, :house_number, :building, :telephone)
  end

end
