# Controller
module AskOverflow
    class CLI
        # =======================
        # ======INITIALIZE=======
        # =======================
        def initialize
            @scraper = ScrapeParse.new
        end

        # =======================
        # ====DISPLAY=METHODS====
        # =======================
        def display_results(query)
            puts"Results"
            puts"blah blah blah blah 8 answers"
            puts"blah blah blah blah 67 answers"
            puts"blah blah blah blah 41 answers"
            puts"blah blah blah blah 10 answers"
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


        # =======================
        # ====HELPER=METHODS=====
        # =======================
        def get_query
            puts "enter a search"
            gets.strip
        end

        def get_result
            puts "Which would you like to read"
            gets.strip
        end

        def back_to_results
            puts ""
            puts "back / exit"
            gets.strip
        end

        def fquery(raw)
            fq = raw.gsub(" ", "+")
            return "q=#{fq}"
        end

        def make_url(query)
            base = 'https://stackoverflow.com/search?'
            q = fquery(query)
            answeredOnly = "+hasaccepted%3Atrue"
            return "#{base}#{q}#{answeredOnly}"
        end

        def fquery(raw)
            fq = raw.gsub(" ", "+")
            return "q=#{fq}"
        end

        def make_url(query)
            base = 'https://stackoverflow.com/search?'
            q = fquery(query)
            answeredOnly = "+hasaccepted%3Atrue"
            return "#{base}#{q}#{answeredOnly}"
        end


        # =======================
        # =====MAIN=METHODS======
        # =======================
        def run
            running = true
            puts "Ask Overflow"
            while running == true
                query = get_query
                query == "exit" ? running = false : viewing = true
                while viewing == true
                    query = fquery(query)
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

# class CLI
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