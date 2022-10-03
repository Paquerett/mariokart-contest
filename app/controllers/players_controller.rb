class PlayersController < ApplicationController
  def new
    @iterator = 1
    @tournament = Tournament.find(params[:tournament_id])
    players = []
    while iterator < tournament.nbplayers
      player = Player.new
      players << player
      iterator += 1
    end
    @players = players
  end

  def create
    @player = Tournament.find(params[:id])
    @player.tournament = Tournament.find(params[:tournament_id])
    @player.save
  end
end
