class NumberConversionsController < ApplicationController
  def index
    safe_params = params.permit(:number, :base, :urlbase)
    
    # if form is submitted
    if (@url = safe_params[:urlbase])
      base = safe_params[:urlbase]
    else
      base = safe_params[:base]
    end
    number = safe_params[:number]
    
    @number_conversion = NumberConversion.new(number: number, base: base)
    @number_conversion.save
    @past_conversions = NumberConversion.all
  end
end
