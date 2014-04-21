class SessionsController < ApplicationController
  respond_to :html

  def new
  end

  def create
    user = login params[:session][:email], params[:session][:password],
      params[:session][:remember_me]
    if !!user
      redirect_back_or_to root_url
    else
      flash[:error] = 'Email or password was invalid.'
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
