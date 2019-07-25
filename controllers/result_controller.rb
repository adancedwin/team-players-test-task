class ResultController < ApplicationController
  def new
    @player_result = PlayerResult.new
  end

  def create
    @player_result = PlayerResult.new(player_result_params)
    if @player_result.save(params)
      redirect_to :somewhere
    else
      render :something
    end
  end

  private

  def player_result_params
    params.require(:player_result).permit(:some, :fields)
  end
end