class ApplicationController < ActionController::Base
  protected

  def verfiy_signed_in
    unless user_signed_in?
      flash[:alert] = 'You must sign in first'
      redirect_to request.referer || root_path
    end
  end
end
