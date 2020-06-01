class Result
    attr_accessor :question, :sample, :tags, :ask_date, :answer_count, :author, :link, :all, :id
    @@all = Array.new

    def initialize(attributes)
        attributes.each do |s, v|
            self.send("#{s}=", v)
        end
        @id = @@all.count + 1
        @@all << self
    end

    def self.all
        @@all
    end
end