# This is a class used to store the data of
# each scraped result in a central, easy to
# access location
class Result
    # Attribute Accessors declared for each
    # piece of information collected from
    # each result
    attr_accessor :question, :sample, :tags, :ask_date, :answer_count, :author, :link, :all, :id, :full_q, :full_a
    # class varible array used to store each
    # result instance
    @@all = Array.new
    # uses metaprogramming and attribut accessors
    # to assign the values of an initial hash to
    # the instance's attributes, then shovels the
    # instance onto @@all
    def initialize(attributes)
        attributes.each do |s, v|
            self.send("#{s}=", v)
        end
        @@all << self
    end
    # allows the user to access the results via
    # human friendly indexing ie 1->10 not 0->9
    def self.find_by_id(id)
        @@all[id.to_i - 1]
    end
    # allows a result's scraped full Q&A to be
    # added to the instance
    def add_full(content_hash)
        content_hash.each do |s, v|
            self.send("#{s}=", v)
        end
    end
    # deletes all existing Result instances
    # used when additional searches are performed
    def self.clear_results
        @@all.clear
    end
    # provides access to the @@all class variable
    def self.all
        @@all
    end
end
