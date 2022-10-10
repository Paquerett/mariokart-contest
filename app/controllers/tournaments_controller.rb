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
    iterateur = 1
    if @tournament.nbplayers % 4 == 0
      while iterateur < @tournament.nbplayers
        @chicken = Chicken.new
        4.times do
          @chicken = Chicken.new
          @chicken.tournament = @tournament
          players = @tournament.players.where(chicken: nil)
          players.sample.chiken = @chicken
          @chicken.save
          player.save
        end
        iterateur += 1
      end
    end
    if @tournament.nbplayers % 4 == 3
      while iterateur < @tournament.nbplayers - 3
        @chicken = Chicken.new
        4.times do
          @chicken = Chicken.new
          @chicken.tournament = @tournament
          players = @tournament.players.where(chicken: nil)
          players.sample.chiken = @chicken
          @chicken.save
          player.save
        end
        iterateur += 1
      end
      3.times do
        @chicken = Chicken.new
        @chicken.tournament = @tournament
        players = @tournament.players.where(chicken: nil)
        players.sample.chiken = @chicken
        @chicken.save
        player.save
      end
    end
    if @tournament.nbplayers % 4 == 2
      while iterateur < @tournament.nbplayers - 6
        @chicken = Chicken.new
        4.times do
          @chicken = Chicken.new
          @chicken.tournament = @tournament
          players = @tournament.players.where(chicken: nil)
          players.sample.chiken = @chicken
          @chicken.save
          player.save
        end
        iterateur += 1
      end
      2.times do
        3.times do
          @chicken = Chicken.new
          @chicken.tournament = @tournament
          players = @tournament.players.where(chicken: nil)
          players.sample.chiken = @chicken
          @chicken.save
          player.save
        end
      end
    end
    if @tournament.nbplayers % 4 == 1
      while iterateur < @tournament.nbplayers - 2
        @chicken = Chicken.new
        4.times do
          @chicken = Chicken.new
          @chicken.tournament = @tournament
          players = @tournament.players.where(chicken: nil)
          players.sample.chiken = @chicken
          @chicken.save
          player.save
        end
        iterateur += 1
      end
      3.times do
        @chicken = Chicken.new
        @chicken.tournament = @tournament
        players = @tournament.players.where(chicken: nil)
        players.sample.chiken = @chicken
        @chicken.save
        player.save
      end
    end
    @chickens = Chicken.all
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :nbplayers)
  end
end
