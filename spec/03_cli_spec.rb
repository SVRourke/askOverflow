require 'spec_helper'

RSpec.describe CLI do
    before(:all) do
        @ui = CLI.new
        @test_hash = {
            :question => "QUESTION",
            :sample => "SAMPLE",
            :tags => "TAGS",
            :ask_date => "DATE",
            :answer_count => "ANSWERS",
            :author => "AUTHOR",
            :full_a => "FULLANSWER",
            :full_q => "FULLQUESTION"
        }
    end
    describe "#greet" do
        it "greets the user" do
            expect {@ui.greet}.to output("askoverflow\n").to_stdout
        end
    end
    describe "#prompt_search" do
        it "asks user for search term" do
            expect {@ui.prompt_search}.to output("please enter a search or exit: \n").to_stdout
        end
    end
    describe "#prompt_result" do
        it "asks the user for the id of their chosen result" do
            expect {@ui.prompt_result}.to output("enter the id of a result to read further, back to do a new search or exit to quit\n").to_stdout
        end
    end
    describe "#prompt_return" do
        it "asks if a user would like to return to the results or leave" do
            expect {@ui.prompt_return}.to output("\n\n\n+++enter to return to results+++\n\n\n\n").to_stdout
        end
    end
    describe "#display_results" do
        it "prints results to the terminal" do
            Result.new(@test_hash)
            expect {@ui.display_results}.to output("++++++++++++++++++++++++++++++++++++++++++++++++++\n|ID:1| QUESTION...\n|ANSWERS answer(s) since: DATE\n|Tags:\tTAGS\n++++++++++++++++++++++++++++++++++++++++++++++++++\n\n").to_stdout
        end
    end
    describe "#display_question" do
        it "prints the full question text to the terminal" do
            expect {@ui.display_question(Result.all.first)}.to output("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n++++++++++++++++++++++++++\n+++++++++QUESTION+++++++++\n++++++++++++++++++++++++++\nFULLQUESTION\n").to_stdout
        end
    end
    describe "#display_answer" do
        it "prints the full answer text to the terminal" do
            expect {@ui.display_answer(Result.all.first)}.to output("\n\n\n\n\n\n\n\n\n\n\n\n++++++++++++++++++++++++++\n++++++++++ANSWER++++++++++\n++++++++++++++++++++++++++\nFULLANSWER\n").to_stdout
        end
    end
end