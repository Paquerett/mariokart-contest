class PlayersController < ApplicationController
  def new
    iterator = 0
    @tournament = Tournament.find(params[:tournament_id])
    @players =[]
   @tournament.nbplayers.times do
    @players << Player.new
   end
  end

  def create
    @player = Player.new(player_params)
    @tournament = Tournament.find(params[:tournament_id])
    @player.tournament = @tournament
    @player.save
    if @tournament.nbplayers == @tournament.players.count
      redirect_to qualification_tournament_path(@tournament), status: :see_other
    end
  end

  def qualification
  end

  private

  def player_params
    params.require(:player).permit(:nickname)
  end
end
