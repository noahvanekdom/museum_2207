require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do
    let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
    it 'exists' do
        expect(dmns).to be_instance_of Museum
    end

    xit 'has a name' do
         expect(dmns.name).to eq "Denver Museum of Nature and Science"
    end

    xit 'initially returns an empty array of exhibits' do
         expect(dmns.exhibits).to eq []
    end

end
