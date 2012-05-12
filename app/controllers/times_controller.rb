class TimesController < ApplicationController
  before_filter :authenicate
  def update 
    times = Times.find(params[:id])
    times.update_attributes(params[:times])
    times.save
    redirect_to :back
  end
end
