module SportsDataApi
  module Ncaamb
    class Season
      attr_reader :id, :year, :type, :games

      def initialize(schedule_hash)
        if schedule_hash && season_hash = schedule_hash["season"]
          @id = season_hash["id"]
          @year = season_hash["year"].to_i
          @type = season_hash["type"].to_sym

          @games = schedule_hash["games"].map do |game_hash|
            Game.new(year: @year, season: @type, game_hash: game_hash)
          end
        end
      end

      ##
      # Check if the requested season is a valid
      # NCAAMB season type.
      #
      # The only valid types are: :reg, :pst, :ct
      def self.valid?(season)
        [:REG, :PST, :CT].include?(season)
      end
    end
  end
end
