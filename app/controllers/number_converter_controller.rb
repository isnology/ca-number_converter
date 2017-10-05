class NumberConverterController < ApplicationController
  def index
    safe_params = params.permit(:number, :base, :urlbase)
    # if form is submitted
    if !params.empty?
      if (@url = params[:urlbase])
        @base = safe_params[:urlbase].to_i
      else
        @base = safe_params[:base].to_i
      end
      @number = safe_params[:number].to_i
      record = NumberConversion.new
      record.number = @number
      record.base = @base
      @answer = record.number_to_base
      
      record.save
    end
  end
end
