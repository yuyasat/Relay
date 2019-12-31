class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = login(params[:email], params[:password])
    if user.present?
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to login_path, notice: 'ログインに失敗しました'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
