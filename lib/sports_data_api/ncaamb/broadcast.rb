module SportsDataApi
  module Ncaamb
    class Broadcast
      attr_reader :network, :satellite
      def initialize(broadcast_hash)
        if broadcast_hash
          @network = broadcast_hash['network']
          @satellite = broadcast_hash['satellite']
        end
      end
    end
  end
end
