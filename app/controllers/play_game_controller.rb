class PlayGameController < ApplicationController
  layout "play_game", except: [:end_game]
  def start_game

    begin
      @player_1 = User.find_by(extension: params[:p1_input])
      @player_2 = User.find_by(extension: params[:p2_input])


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
    rescue => e
      flash[:notice] = "One of the extensions you entered are incorrect"
      redirect_to '/login/index'
    end
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
      @player_1.current_game_score += @dart1 + @dart2 +@dart3
      @player_1.save!
      @player_1_turn = 'notyourturn'
      @player_2_turn = 'yourturn'
    end

    if (params[:p2_score_1]) 
      @dart1 = params[:p2_score_1].to_i
      @dart2 = params[:p2_score_2].to_i
      @dart3 = params[:p2_score_3].to_i
      @player_2.current_game_score += @dart1 + @dart2 +@dart3
      @player_2.save!  
      @game.round_count+= 1
      @game.save!
      @player_1_turn = 'yourturn'
      @player_2_turn = 'notyourturn'
    end

    # if 3 rounds are up then calculate the winner and populate their stats
    if (@game.round_count >= 3)
      if (@player_1.current_game_score > @player_2.current_game_score)
        @winning_player = @player_1
        @losing_player = @player_2
      elsif (@player_1.current_game_score < @player_2.current_game_score) 
        @winning_player = @player_2
        @losing_player = @player_1
      else
        @tie_game = true
      end
      
      #update list of scores associated with the player
      @p_1_new_historical_score = HistoricalScore.new({'score' => @player_1.current_game_score})
      @p_2_new_historical_score = HistoricalScore.new({'score' => @player_2.current_game_score})
      @player_1.historical_scores << @p_1_new_historical_score
      @player_2.historical_scores << @p_2_new_historical_score

      #update if the player is a star player yet
      @player_1.is_star_player = true if @player_1.current_game_score >= 200
      @player_2.is_star_player = true if @player_2.current_game_score >= 200

      #update the players average score
      @player_1.historical_scores.each_with_index do |historical_scores, index|
        @player_1.average_score += historical_scores.score
        @score_count = index + 1
      end

      @player_1.average_score /= @score_count 

      @player_2.historical_scores.each_with_index do |historical_scores, index|
        @player_2.average_score += historical_scores.score
        @score_count = index + 1
      end
      @player_2.average_score /= @score_count

      #update draws and set output messages
      if (@tie_game)
        @player_1.draws += 1
        @player_2.draws += 1
        @winning_statement = "The game is a draw with both players achieving #{@player_1.current_game_score}"
      else
        #update the players wins/losses
        @winning_player.wins += 1
        @losing_player.losses += 1
        @winning_statement = "#{@winning_player.name} wins with a score of #{@winning_player.current_game_score}"
        @losing_statement =  "#{@losing_player.name} loses with a score of #{@losing_player.current_game_score}"
      end

      @player_1.current_game_score = 0
      @player_2.current_game_score = 0

      @player_1.save!
      @player_2.save!

      render 'play_game/end_game', layout: "layouts/application"
    end  
  end

  def end_game
    @player_1 ||= session[:player_1_id] &&
      User.find_by(id: session[:player_1_id])
    @player_2 ||= session[:player_2_id] &&
      User.find_by(id: session[:player_2_id])
    @game ||= session[:game_id] &&
      Game.find_by(id: session[:game_id])
  end
end
