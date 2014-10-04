class LoginController < ApplicationController
  def index
    @users = User.order('average_score DESC, name')
  end
end
