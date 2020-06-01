class Result
    attr_accessor :question, :sample, :tags, :ask_date, :answer_count, :author, :link, :all
    @@all = Array.new

    def initialize(attributes)
        attributes.each do |s, v|
            self.send("#{s}=", v)
        end
        @@all << self
    end
    
    def self.all
        @@all
    end
end