class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Добро пожаловать!"
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Попробуйте еще раз' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end