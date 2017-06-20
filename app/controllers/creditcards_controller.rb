class CreditcardsController < ApplicationController

  def new
    @creditcard = Creditcard.new
    @years      = set_years
    @monthes    = set_monthes
  end


  private
  def set_years
    years = []
    i = 0
    while i < 10 do
      years <<  Date.today.year + i
      i += 1
    end
    return years
  end

  def set_monthes
    monthes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  end

end
