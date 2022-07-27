class Museum
    attr_reader :name, :exhibits, :patrons
    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        @exhibits.find_all { |exhibit| patron.interests.include? exhibit.name}
    end

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest
        exhibits_with_patrons = {}
        @exhibits.each do |exhibit|
            exhibits_with_patrons[exhibit] = @patrons.select { |patron| patron.interests.include?(exhibit.name)}
        end
        exhibits_with_patrons
    end
end
