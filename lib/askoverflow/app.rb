require 'pry'
require '../askoverflow.rb'
# require_relative './cli.rb'
# require_relative './result.rb'
# require_relative './scrape.rb'

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
        running = true
        # greet user
        @ui.greet_user
        # main loop of the program
        while running == true
            #  get search terms
            @ui.prompt_query
            query = gets.strip
            query == "exit" ? running = false : viewing = true
            # scrape term
            url = make_url(query)
            @scraper.getSearchResults(url)
            # loop allows moving back and forth between "pages"
            while viewing == true
                # display results
                @ui.display_results
                # get specific result
                @ui.prompt_result
                result = gets.strip
                # result = Result.all.find {|r| r.id == result}
                # @scraper.getPostContent(Result)
                # If input is exit do so else display that result
                if result.to_s == 'exit'
                    viewing = false 
                    running = false
                else
                    @ui.display_specific(result)
                    @ui.prompt_return
                    answer = gets.strip

                    if answer == 'exit'
                        viewing = false
                        running = false
                    end
                end
                # ask user if they would like to return to results
                # if exit do so else go back to results
            end
        end
        @ui.goodbye
    end
end
binding.pry