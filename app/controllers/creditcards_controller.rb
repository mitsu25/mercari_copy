class CreditcardsController < ApplicationController

  def new
    @creditcard = Creditcard.new
    @years      = set_years
    @monthes    = set_monthes
  end

  def create
  end

  private
  def set_years
    years = []
    i = 0
    while i < 9 do
      years <<  Date.today.year + i
      i += 1
    end
    return years
  end

  def set_monthes
    monthes = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
  end

end
