require 'pry'
require '../askoverflow.rb'

class App
    def initialize
        @ui = CLI.new
        @scraper = Scrape.new
    end

    def f_query(raw)
        fq = raw.gsub(" ", "+")
        return "q=#{fq}"
    end

    def make_url(query)
        # UPDATE FOR RELEVANCE TODO
        base = 'https://stackoverflow.com/search?'
        q = f_query(query)
        answeredOnly = "+hasaccepted%3Atrue"
        return "#{base}#{q}#{answeredOnly}"
    end

    def run
        # greet user
        # main loop of the program
        #  get search terms
        # scrape term
        # display results
        # get specific result
        # ask user if they would like to return to results
        # if exit do so else go back to results
    end
end
# binding.pry