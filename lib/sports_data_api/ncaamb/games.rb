module SportsDataApi
  module Ncaamb
    class Games
      include Enumerable
      attr_reader :games, :date

      def initialize(games_hash)
        @date = games_hash['date']

        @games = games_hash['games'].map do |game_hash|
          Game.new(date: @date, game_hash: game_hash)
        end
      end

      def each &block
        @games.each do |game|
          if block_given?
            block.call game
          else
            yield game
          end
        end
      end
    end
  end
end
