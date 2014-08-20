class LoginsController < ApplicationController
  def index

  end

  def show
    if user.authenticated?
      redirect_to admin_path
    else
      redirect_to login_path
    end
  end
end
