require 'spec_helper'

describe SportsDataApi::Ncaamb::TournamentSchedule, vcr: {
    cassette_name: 'sports_data_api_ncaamb_tournament_schedule',
    record: :new_episodes,
    match_requests_on: [:host, :path]
} do
  context 'results from daily schedule fetch' do
    let(:tournament_schedule) do
      SportsDataApi.set_access_level(:ncaamb, 't')
      SportsDataApi.set_key(:ncaamb, api_key(:ncaamb))
      SportsDataApi::Ncaamb.tournament_schedule("541807c8-9a76-4999-a2ad-c0ba8a553c3d")
    end
    subject { tournament_schedule }
    it { should be_an_instance_of(SportsDataApi::Ncaamb::TournamentSchedule) }
    its(:id) { should eq "541807c8-9a76-4999-a2ad-c0ba8a553c3d" }
    its(:name) { should eq "NCAA Men's Division I Basketball Tournament" }
    its(:games) { should have(67).tournament_games }
  end
end