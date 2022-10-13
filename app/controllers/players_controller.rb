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
      iterateur = 1
      if @tournament.chickens == []
        if @tournament.nbplayers % 4 == 0
          while iterateur < @tournament.nbplayers
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil)
              player = players.sample
              player.chicken = @chicken
              @chicken.save
              player.save
              iterateur += 1
            end
          end
        end
        if @tournament.nbplayers % 4 == 3
          while iterateur < @tournament.nbplayers - 3
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil)
              player = players.sample
              player.chicken = @chicken
              @chicken.save
              player.save
              iterateur += 1
            end
          end
          @chicken = Chicken.new
          3.times do
            @chicken.tournament = @tournament
            players = @tournament.players.where(chicken: nil)
            player = players.sample
            player.chicken = @chicken
            @chicken.save
            player.save
          end
        end
        if @tournament.nbplayers % 4 == 2
          while iterateur < @tournament.nbplayers - 6
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil)
              player = players.sample
              player.chicken = @chicken
              @chicken.save
              player.save
              iterateur += 1
            end
          end
          2.times do
            @chicken = Chicken.new
            3.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil)
              player = players.sample
              player.chicken = @chicken
              @chicken.save
              player.save
            end
          end
        end
        if @tournament.nbplayers % 4 == 1
          while iterateur < @tournament.nbplayers - 2
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil)
              player = players.sample
              player.chicken = @chicken
              @chicken.save
              player.save
              iterateur += 1
            end
          end
          @chicken = Chicken.new
          3.times do
            @chicken.tournament = @tournament
            players = @tournament.players.where(chicken: nil)
            player = players.sample
            player.chicken = @chicken
            @chicken.save
            player.save
          end
        end
      end
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
