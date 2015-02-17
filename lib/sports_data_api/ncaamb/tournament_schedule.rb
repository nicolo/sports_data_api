module SportsDataApi
  module Ncaamb
    class TournamentSchedule
      attr_reader :id, :games

      def initialize(xml)
        if xml.is_a? Nokogiri::XML::NodeSet
          @id = xml.first["id"]
          # @games = xml.first.xpath("round").map do |game_xml|
          #   TournamentGame.new(round_number: @year, round_name: @type, xml: game_xml)
          # end
        end
      end

    end
  end
end
