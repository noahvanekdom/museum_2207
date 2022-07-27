require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do
    let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
    let(:gems_and_minerals)  {Exhibit.new({name: "Gems and Minerals", cost: 0})}
    let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
    let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}
    let(:patron_1) {Patron.new("Bob", 20)}
    let(:patron_2) {Patron.new("Sally", 20)}
    let(:patron_3) {Patron.new("Johnny", 5)}

    it 'exists' do
        expect(dmns).to be_instance_of Museum
    end

    it 'has a name' do
         expect(dmns.name).to eq "Denver Museum of Nature and Science"
    end

    it 'initially returns an empty array of exhibits' do
         expect(dmns.exhibits).to eq []
    end

    it 'can add exhibits and return an array of added exhibits' do

        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)

        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")
        patron_2.add_interest("IMAX")

        expect(dmns.exhibits).to eq [gems_and_minerals, dead_sea_scrolls, imax]

    end

    it 'can return an array of recommended exhibits for patrons' do
        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)

        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")
        patron_2.add_interest("IMAX")

        expect(dmns.recommend_exhibits(patron_1)).to eq [gems_and_minerals, dead_sea_scrolls]
        expect(dmns.recommend_exhibits(patron_2)).to eq [imax]

    end


    it 'can return an array of patrons admitted' do
        expect(dmns.patrons).to eq []

        dmns.admit(patron_1)
        dmns.admit(patron_2)
        dmns.admit(patron_3)

        expect(dmns.patrons).to eq [patron_1, patron_2, patron_3]
    end

    it 'can return a hash of exhibits and the patrons interested in them' do

        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)

        dmns.admit(patron_1)
        dmns.admit(patron_2)
        dmns.admit(patron_3)

        patron_1.add_interest("Dead Sea Scrolls")
        patron_2.add_interest("Dead Sea Scrolls")
        patron_3.add_interest("Dead Sea Scrolls")



        expect(dmns.patrons_by_exhibit_interest).to eq({dead_sea_scrolls: [patron_1, patron_2, patron_3], gems_and_minerals: [], imax: []})
    end

end
