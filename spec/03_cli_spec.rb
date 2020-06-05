# spec/03_cli/spec.rb
require 'rspec'
require 'askoverflow'

RSpec.describe CLI do
    before(:each) do
        ui = CLI.new
        test_hash = {
            :question => "QUESTION",
            :sample => "SAMPLE",
            :tags => "TAGS",
            :ask_date => "DATE",
            :answer_count => "ANSWERS",
            :author => "AUTHOR",
            :full_a => "FULLANSWER"
            :full_q => "FULLQUESTION"
        }
        Result.new_from_scrape(test_hash)
    end
    describe "#greet" do
        it "greets the user" do
            ui.greet
            STDOUT.should_receive(:puts).with('AskOverflow')
        end
    end
    describe "#prompt_search" do
        it "asks user for search term" do
            ui.prompt_search
            STDOUT.should_receive(:puts).with('please enter a search or exit: ')
        end
    end
    describe "#prompt_result" do
        it "asks the user for the id of their chosen result" do
            ui.prompt_result
            STDOUT.should_receive(:puts).with('enter the id of a result')
        end
    end
    describe "#prompt_return" do
        it "asks if a user would like to return to the results or leave" do
            ui.prompt_return
            STDOUT.should_receive(:puts).with('back / exit?')
        end
    end
    describe "#display_results" do
        it "prints results to the terminal" do
            ui.display_results
            STDOUT.should_receive(:puts).with('1 ||QUESTION||SAMPLE||TAGS||DATE||ANSWERS||AUTHOR')
        end
    end
    describe "#display_specific" do
        it "prints the chosen result to terminal in high detail" do
            ui.display_specific
            STDOUT.should_receive(:puts).with('FULLQUESTION||FULLANSWER')
        end
    end
end