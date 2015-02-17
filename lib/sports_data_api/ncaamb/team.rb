module SportsDataApi
  module Ncaamb
    class Team
      attr_reader :id, :name, :market, :alias, :conference, :division,
                  :stats, :players, :points

      def initialize(team_hash, conference = nil, division = nil)
        if team_hash
          @id = team_hash['id']
          @name = team_hash['name']
          @market = team_hash['market']
          @alias = team_hash['alias']
          @points = team_hash['points'] ? team_hash['points'].to_i : nil
          @conference = conference
          @division = division
          players = team_hash["players"] || []
          @players = players.map do |player_hash|
            Player.new(player_hash)
          end
        end
      end

      ##
      # Compare the Team with another team
      def ==(other)
        # Must have an id to compare
        return false if self.id.nil?

        if other.is_a? SportsDataApi::Ncaamb::Team
          return false if other.id.nil?
          self.id === other.id
        elsif other.is_a? Symbol
          self.id.to_sym === other
        else
          super(other)
        end
      end
    end
  end
end
