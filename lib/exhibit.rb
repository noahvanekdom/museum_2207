class Exhibit
    attr_reader :details
    def initialize(details)
        @details = details
    end

    def name
        @details[:name]
    end

    def cost
        @details[:cost]
    end
end
