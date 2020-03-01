class DestinationsController < ApplicationController

  def index
    @test = Test.new
    @test_obj = Test.find(5)
  end
end
