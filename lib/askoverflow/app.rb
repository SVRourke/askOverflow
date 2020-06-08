class App
    # creates a new CLI and Scrape object upon initialization
    def initialize
        @ui = CLI.new
        @scraper = Scrape.new
    end
    # formats  the user's search string into the stackoverflow
    # url query format
    def f_query(raw)
        fq = raw.gsub(" ", "+")
        return "q=#{fq}"
    end
    # take the user's raw search string and return a url
    def make_url(query)
        base = 'https://stackoverflow.com/search?'
        q = f_query(query)
        answeredOnly = "+hasaccepted%3Atrue"
        return "#{base}#{q}#{answeredOnly}"
    end
    # this is the main program control
    def run
        # greets the user on start
        @ui.greet
        # main loop
        running = true
        while running
            # preemptively clear Results for multiple searches
            # prompt the user for their search terms
            # exit if desired by user
            # otherwise scrape results from query
            Result.clear_results
            @ui.prompt_search
            query = gets.strip
            break if query == 'exit'
            url = make_url(query)
            @scraper.scrape_results(url)
            # "viewing loop"
            # this loop allows the user to return to the results
            # display or to try a different search
            # displays scraped results, prompts the user for a
            # specific result, to return to try another search
            # or exit the program
            viewing_results = true
            while viewing_results
                @ui.display_results
                @ui.prompt_result
                result_id = gets.strip
                if result_id == 'exit'
                    running = false 
                    break
                end
                break if result_id == 'back'
                # Scrapes the specific result, and adds data
                chosen_result = Result.find_by_id(result_id)
                @scraper.scrape_specific(chosen_result)
                # "Specific View Loop"
                # this loop allows us to view a specific result
                # and subsequently return to the results list
                viewing_result = true
                while viewing_result
                    @ui.display_question(chosen_result)
                    @ui.prompt_next
                    @ui.display_answer(chosen_result)
                    @ui.prompt_return
                    break
                end
            end
        end
        @ui.goodbye
    end
end
# binding.pry