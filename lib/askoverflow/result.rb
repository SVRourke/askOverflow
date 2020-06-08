class Result
    attr_accessor :question, :sample, :tags, :ask_date, :answer_count, :author, :link, :all, :id, :full_q, :full_a
    @@all = Array.new

    def initialize(attributes)
        attributes.each do |s, v|
            self.send("#{s}=", v)
        end
        @id = @@all.count + 1
        @@all << self
    end

    def self.find_by_id(id)
        @@all[id - 1]
    end

    def add_full(content_hash)
        content_hash.each do |s, v|
            self.send("#{s}=", v)
        end
    end

    def self.clear_results
        @@all.clear
    end
    
    def self.all
        @@all
    end
end
