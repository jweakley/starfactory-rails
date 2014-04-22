class SessionsController < ApplicationController
  respond_to :html

  def new
    if logged_in?
      flash[:notice] = "You're already logged in."
      redirect_to root_url, status: 302
    else
      add_breadcrumb 'Login'
    end
  end

  def create
    @user = login params[:session][:email], params[:session][:password],
      params[:session][:remember_me]
    if !!@user
      redirect_to root_url
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
