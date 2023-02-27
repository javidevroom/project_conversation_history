class WelcomeController < ApplicationController
  def show
    redirect_to projects_path if current_user.present?
  end
end
