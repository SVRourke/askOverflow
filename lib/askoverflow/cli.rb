# Controller
module AskOverflow
    class CLI
        

        def get_query
            puts "enter a search"
            answer = gets.strip
        end

        def display_results(query)
            puts"Results"
            puts"blah blah blah blah 8 answers"
            puts"blah blah blah blah 67 answers"
            puts"blah blah blah blah 41 answers"
            puts"blah blah blah blah 10 answers"
        end

        def get_result
            puts "Which would you like to read"
            answer = gets.strip
        end

        def display_specific
            puts "Q"
            puts "sldjfslkdnflksfgkdfvdfbgdB?"
            puts "sjvndlfvndklfnvkdnfklbvdmfvdf"
            puts "sjvndlfvndklfnvkdnfklbsfdgkdh"
            puts "sjdfjgdljfngldknfgkldnf"
            puts "A"
            puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
            puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
            puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
            puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
            puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
            puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
        end

        def back_to_results
            puts ""
            puts "back / exit"
            return gets.strip
        end

        def run
            running = true
            puts "Ask Overflow"

            while running == true
                query = get_query

                if query == "exit"
                    running = false
                else
                    viewing = true

                    while viewing == true
                        display_results(query)
                        specific_result = get_result

                        if specific_result.to_s == 'exit'
                            viewing = false
                            running = false
                        else
                            display_specific
                            # back_to_results ? next : running = false
                            puts back_to_results == "exit"
                        end
                    end
                end
            end
        end
    end
end

# require_relative "./result.rb"
# require_relative "scrape.rb"
# require 'pry'

# class CLI
#     def initialize
#         @scraper = ScrapeParse.new
#     end

#     def welcome
#         puts "askOverflow."
#         puts "Please enter a phrase to search:"
#         answer = gets.strip
#     end

#     def displayAllResults
#         count = 0
#         Result.all do |result|
#             count ++ 1
#             puts"#{count} #{:question}"
#             puts"#{:answer_count} answers since #{:ask_date}"
#             puts"tags: #{:tags}"
#             puts "#{sample[0, 20]}..."
#         end
#     end

#     def fquery(raw)
#         fq = raw.gsub(" ", "+")
#         return "q=#{fq}"
#     end

#     def make_url(query)
#         base = 'https://stackoverflow.com/search?'
#         q = fquery(query)
#         answeredOnly = "+hasaccepted%3Atrue"
#         return "#{base}#{q}#{answeredOnly}"
#     end

#     def run
#         raw_query = self.welcome
#         url = make_url(raw_query)
#         @scraper.getSearchResults(url)
#     end

# end
# binding.pry