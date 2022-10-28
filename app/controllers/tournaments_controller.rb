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
      @nextround += 1 if player.points != nil
    end
  end

  def demifinal
    @tournament = Tournament.find(params[:id])
    name = ["banane", "carapace", "champignon", "clochette", "crossing", "eclair", "etoile", "feuille", "fleur", "oeuf", "speciale", "triforce"]
    if @tournament.players.where.not(pointsdemi: nil) == []
      @tournament.chickens.each do |chicken|
        chicken.circuit_name = ""
        chicken.save
      end
      @tournament.players.each do |player|
        player.chicken = nil
        player.save
      end
      iterateur = 1
        if @tournament.nbplayers % 4 == 0
          while iterateur < @tournament.nbplayers
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil)
              player = players.sample
              player.chicken = @chicken
              @chicken.circuit_name = name.sample
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
              @chicken.circuit_name = name.sample
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
            @chicken.circuit_name = name.sample
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
              @chicken.circuit_name = name.sample
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
              @chicken.circuit_name = name.sample
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
              @chicken.circuit_name = name.sample
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
            @chicken.circuit_name = name.sample
            @chicken.save
            player.save
          end
        end
      end
        @nextround = 0
        @tournament.players.each do |player|
          @nextround += 1 if player.pointsdemi != nil
        end
  end

  def final
    @tournament = Tournament.find(params[:id])
    name = ["banane", "carapace", "champignon", "clochette", "crossing", "eclair", "etoile", "feuille", "fleur", "oeuf", "speciale", "triforce"]
    iterateur = 1
    if @tournament.players.where.not(pointsfinal: nil) == []
      @tournament.chickens.each do |chicken|
        chicken.circuit_name = ""
        chicken.save
      end
      @tournament.players.each do |player|
        player.chicken = nil
        player.pointstotal = player.pointsdemi + player.points
        player.save
      end
      if @tournament.nbplayers % 4 == 0
      while iterateur < @tournament.nbplayers
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
              player = players.first
              player.chicken = @chicken
              @chicken.circuit_name = name.sample
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
              players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
              player = players.first
              player.chicken = @chicken
              @chicken.circuit_name = name.sample
              @chicken.save
              player.save
              iterateur += 1
            end
          end
          @chicken = Chicken.new
          3.times do
            @chicken.tournament = @tournament
            players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
            player = players.first
            player.chicken = @chicken
            @chicken.circuit_name = name.sample
            @chicken.save
            player.save
          end
        end
        if @tournament.nbplayers % 4 == 2
          while iterateur < @tournament.nbplayers - 6
            @chicken = Chicken.new
            4.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
              player = players.first
              player.chicken = @chicken
              @chicken.circuit_name = name.sample
              @chicken.save
              player.save
              iterateur += 1
            end
          end
          2.times do
            @chicken = Chicken.new
            3.times do
              @chicken.tournament = @tournament
              players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
              player = players.first
              player.chicken = @chicken
              @chicken.circuit_name = name.sample
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
              players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
              player = players.first
              player.chicken = @chicken
              @chicken.circuit_name = name.sample
              @chicken.save
              player.save
              iterateur += 1
            end
          end
          @chicken = Chicken.new
          3.times do
            @chicken.tournament = @tournament
            players = @tournament.players.where(chicken: nil).order(pointstotal: :desc)
            player = players.first
            player.chicken = @chicken
            @chicken.circuit_name = name.sample
            @chicken.save
            player.save
          end
        end
      end
        @nextround = 0
        @tournament.players.each do |player|
          @nextround += 1 if player.pointsfinal != nil
        end
  end

  def ranking
    @tournament = Tournament.find(params[:id])
    @classement = 0
    @players = @tournament.players.order(pointstotal: :desc)
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :nbplayers)
  end
end
