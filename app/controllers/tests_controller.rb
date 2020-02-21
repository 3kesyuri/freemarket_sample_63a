class TestsController < ApplicationController

  def index
    @test = Test.new
    @test_obj = Test.all
  end

  def create
    @test = Test.new(test_params)
    if @test.save!
      redirect_to root_path
    end
  end

  def test_params
    params.require(:test).permit(:text, :image)
  end
end
