class JobsController < ApplicationController

  def index
    @company = Company.new
    @user = User.new
  end

end
