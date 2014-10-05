class PlayGameController < ApplicationController
  layout "play_game", except: [:end_game]
  def start_game
    @player_1 = User.find_by(extension: params[:p1_extension])
    @player_2 = User.find_by(extension: params[:p2_extension])
    @game = Game.new() do |game|
      game.users << @player_1
      game.users << @player_2
      game.save!
    end
    session[:player_1_id] = @player_1.id
    session[:player_2_id] = @player_2.id
    session[:game_id] = @game.id

    @player_1_turn = 'yourturn'
    @player_2_turn = 'notyourturn'

  end

  def update_score
    @player_1 ||= session[:player_1_id] &&
      User.find_by(id: session[:player_1_id])
    @player_2 ||= session[:player_2_id] &&
      User.find_by(id: session[:player_2_id])
    @game ||= session[:game_id] &&
      Game.find_by(id: session[:game_id])


    if (params[:p1_score_1])
      @dart1 = params[:p1_score_1].to_i
      @dart2 = params[:p1_score_2].to_i
      @dart3 = params[:p1_score_3].to_i  
      @game.player_1_total_score += @dart1 + @dart2 +@dart3
      @game.save!
      @player_1_turn = 'notyourturn'
      @player_2_turn = 'yourturn'
    end

    if (params[:p2_score_1]) 
      @dart1 = params[:p2_score_1].to_i
      @dart2 = params[:p2_score_2].to_i
      @dart3 = params[:p2_score_3].to_i
      @game.player_2_total_score += @dart1 + @dart2 +@dart3
      @game.round_count+= 1
      @game.save!  
      @player_1_turn = 'yourturn'
      @player_2_turn = 'notyourturn'
    end

    if (@game.round_count = 3)
      render :action => 'end_game'
    end  
  end

  def end_game
  end
end
