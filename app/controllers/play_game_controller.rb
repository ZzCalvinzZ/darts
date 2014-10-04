class PlayGameController < ApplicationController
  layout "play_game"
  def start_game
    @player_1 = User.find_by(extension: params[:p1_extension])
    @player_2 = User.find_by(extension: params[:p2_extension])
    @game = Game.new() do |game|
        game.users << @player_1
        game.users << @player_2
        game.save!
      end
  end

  def update_score
    @game = Game.order(:id).last
    @player_1 = @game.users[0]
    @player_2 = @game.users[1]
    if (params[:p1_score_1])
      @dart1 = params[:p1_score_1].to_i
      @dart2 = params[:p1_score_2].to_i
      @dart3 = params[:p1_score_3].to_i  
      puts @dart3  
      @game.player_1_total_score += @dart1 + @dart2 +@dart3
    end
    if (params[:p2_score_1]) 
      @dart1 = params[:p2_score_1].to_i
      @dart2 = params[:p2_score_2].to_i
      @dart3 = params[:p2_score_3].to_i
      @game.player_2_total_score += @dart1 + @dart2 +@dart3
    end


  end

  def end_game
  end
end
