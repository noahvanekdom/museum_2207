require './lib/patron'

RSpec.describe Patron do
    let(:patron_1) {Patron.new("Bob", 20)}

    it 'has a name' do
        expect(patron_1.name).to eq "Bob"
    end

    it 'has money to spend' do
        expect(patron_1.spending_money).to eq 20
    end

    it 'can return an array of interests' do
        expect(patron_1.interests).to eq []

        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")

        expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
    end
end