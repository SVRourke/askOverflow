require 'rspec'
require 'askoverflow'

RSpec.describe App do
    describe "new" do
       
    end
    describe "#f_query" do
        
    end
    describe "#build_url" do
        if "takes a string query and returns a url to scrape" do
            test_app = App.new
            query = "what is ruby"
            expect(test_app.build_url(query)).to eq("https://stackoverflow.com/search?tab=relevance&q=what%20is%20ruby")
        end
    end
end

#     def run
#         running = true
#         # greet user
#         @ui.greet_user
#         # main loop of the program
#         while running == true
#             #  get search terms
#             @ui.prompt_query
#             query = gets.strip
#             query == "exit" ? running = false : viewing = true
#             # scrape term
#             url = make_url(query)
#             @scraper.getSearchResults(url)
#             # loop allows moving back and forth between "pages"
#             while viewing == true
#                 # display results
#                 @ui.display_results
#                 # get specific result
#                 @ui.prompt_result
#                 result = gets.strip
#                 # result = Result.all.find {|r| r.id == result}
#                 # @scraper.getPostContent(Result)
#                 # If input is exit do so else display that result
#                 if result.to_s == 'exit'
#                     viewing = false 
#                     running = false
#                 else
#                     @ui.display_specific(result)
#                     @ui.prompt_return
#                     answer = gets.strip

#                     if answer == 'exit'
#                         viewing = false
#                         running = false
#                     end
#                 end
#                 # ask user if they would like to return to results
#                 # if exit do so else go back to results
#             end
#         end
#         @ui.goodbye
#     end
# end
# binding.pry