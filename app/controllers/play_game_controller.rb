class PlayGameController < ApplicationController
  def start_game
    @player_1 = User.find_by(extension: params[:p1_extension])
    @player_2 = User.find_by(extension: params[:p2_extension])
    @game = Game.new() do |game|
        game.users << @player_1
        game.users << @player_2
        game.save!
      end
    puts @game.id  


  end

  def end_game
  end
end
