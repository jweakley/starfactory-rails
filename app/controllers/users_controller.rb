class UsersController < ApplicationController
  respond_to :html

  def new
    @user = User.new
    add_breadcrumb 'Register'
  end
    
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
    end
    add_breadcrumb 'Register'
    respond_with @user
  end
end
