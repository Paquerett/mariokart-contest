class TournamentsController < ApplicationController
  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.user = current_user
    @tournament.save
    @players = []
    redirect_to new_tournament_player_path(@tournament), status: :see_other
  end

  def qualification
    @tournament = Tournament.find(params[:id])
    @nextround = 0
    @tournament.players.each do |player|
      @nextround = 1 if player.points.positive?
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :nbplayers)
  end
end
