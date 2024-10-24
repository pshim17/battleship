class Ship
    attr_reader :name, :health

    def initialize (name, health)
        @name = name
        @health = health
    end

    def hit
        @health -= 1
    end

    def sunk?
        if @health == 0
            true
        else
            false
        end
    end
end