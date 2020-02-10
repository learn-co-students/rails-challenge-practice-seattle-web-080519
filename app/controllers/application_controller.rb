class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    redirect_to companies_path
  end
  
end
