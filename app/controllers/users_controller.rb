class UsersController < ApplicationController

  def show
    @test = Test.new
    @test_obj = Test.find(5)
  end
end
