class HomeController < ApplicationController
  
  def index
    redirect_to portfolios_path if user_signed_in? #redirect when user signs in

    #add api for .env
    

  end

  def about
  end

end
