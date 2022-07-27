require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do
    let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
    let(:gems_and_minerals)  {Exhibit.new({name: "Gems and Minerals", cost: 0})}
    let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
    let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}
    let(:patron_1) {Patron.new("Bob", 20)}
    let(:patron_2) {Patron.new("Sally", 20))}

    it 'exists' do
        expect(dmns).to be_instance_of Museum
    end

    it 'has a name' do
         expect(dmns.name).to eq "Denver Museum of Nature and Science"
    end

    it 'initially returns an empty array of exhibits' do
         expect(dmns.exhibits).to eq []
    end

    context 'when exhibits are added' do

        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)

        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")
        patron_2.add_interest("IMAX")


        xit 'returns an array of exhibits at the museum' do
        end

        xit 'can recommend exhibits that match guests interests' do
        end
    end
end
