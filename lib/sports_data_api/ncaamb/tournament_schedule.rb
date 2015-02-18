module SportsDataApi
  module Ncaamb
    class TournamentSchedule
      attr_reader :id, :name, :games

      def initialize(xml)
        if xml.is_a? Nokogiri::XML::NodeSet
          @id = xml.first["id"]
          @name = xml.first["name"]

          @games = xml.first.xpath("round").map { |round_xml|
            games_from_round(round_xml)
          }.flatten
        end
      end


      private

      def games_from_round(round_xml)
        round = {
          number: round_xml['sequence'],
          name: round_xml['name'] 
        }
        if round_xml.xpath('bracket').first
          round_xml.xpath('bracket').map do |bracket_xml|
            traverse_games(bracket_xml, round, bracket_xml['name'])
          end
        else
          traverse_games(round_xml, round, nil)
        end
      end

      def traverse_games(xml, round, bracket_name)
        xml.xpath('game').map do |game_xml|
          TournamentGame.new(round: round, bracket: bracket_name, xml: game_xml)
        end
      end

    end
  end
end