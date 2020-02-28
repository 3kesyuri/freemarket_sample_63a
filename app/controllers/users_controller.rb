class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def show
    @test = Test.new
    @test_obj = Test.find(5)
  end
end
