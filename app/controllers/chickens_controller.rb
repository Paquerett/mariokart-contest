class ChickensController < ApplicationController
  def show
    @chicken = Chicken.find(params[:id])
    @players = @chicken.players
    @tournament = @chicken.tournament
  end
end
