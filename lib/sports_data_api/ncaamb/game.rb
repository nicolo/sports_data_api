module SportsDataApi
  module Ncaamb
    class Game
      attr_reader :id, :scheduled, :home, :home_team, :away,
        :away_team, :status, :venue, :broadcast, :year, :season,
        :date, :half, :clock

      def initialize(args={})
        game_hash = args.fetch(:game_hash)
        @year = args[:year] ? args[:year].to_i : nil
        @season = args[:season] ? args[:season].to_sym : nil
        @date = args[:date]

        if game_hash
          home_hash = game_hash['home']
          away_hash = game_hash['away']
          @id = game_hash['id']
          @scheduled = Time.parse game_hash['scheduled']
          @home = home_hash ? home_hash['id'] : nil
          @away = away_hash ? away_hash['id'] : nil
          @status = game_hash['status']
          @clock = game_hash['clock']
          @half = game_hash['half'] ? game_hash['half'].to_i : nil
          @home_team = Team.new(home_hash)
          @away_team = Team.new(away_hash)
          @venue = Venue.new(game_hash['venue'])
          @broadcast = Broadcast.new(game_hash['broadcast'])
        end
      end

      ##
      # Wrapper for Nba.game_summary
      # TODO
      def summary
        Ncaamb.game_summary(@id)
      end

      ##
      # Wrapper for Nba.pbp (Nba.play_by_play)
      # TODO
      def pbp
        raise NotImplementedError
      end

      ##
      # Wrapper for Nba.boxscore
      # TODO
      def boxscore
        raise NotImplementedError
      end
    end
  end
end
