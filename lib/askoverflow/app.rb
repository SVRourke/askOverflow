require 'pry'
require 'askoverflow.rb'

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

    # def greet_user
    
    # end

    def run
        # main loop of the program
        running = true
        
        # greet user
        @ui.greet
        
        #  get search terms
        @ui.prompt_search
        query = gets.strip
        running == false if query == 'exit'

        # scrape term
        url = make_url(query)
        @scraper.scrape_results(url)

        # display results
        @ui.display_results

        # get specific result
        @ui.prompt_result
        chosen_result = gets.strip
        running == false if chosen_result == 'exit'

        # scrape specific
        @scraper.scrape_specific(Result.find_by_id(chosen_result)])

        # display specific
        @ui.display_specific()


        # ask user if they would like to return to results
        @ui.prompt_return
        
        # if exit do so else go back to results
    end
end
# binding.pry