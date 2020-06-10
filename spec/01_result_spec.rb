# spec/result_spec.rb
require './spec_helper'

RSpec.describe Result do
    describe "#new" do
        it "accepts a hash of values and creates a new Result with supplied values" do
            a = Result.new({:question => "?"})
            expect(a.question).to eq("?")
            expect(a.class).to eq(Result)
            Result.clear_results
        end
    end
    # fix
    describe "#find_by_id" do
        it "accepts a user entered index for a 1->10 indexed list of results and returns the proper result" do
            Result.new({:question => "?"})
            Result.new({:question => "!"})
            Result.new({:question => "Correct!"})
            expect(Result.find_by_id(3).question).to eq("Correct!")
            Result.clear_results
        end
    end
    # fix
    describe "#add_full" do
        it "accepts a hash of additional data and adds it to the Result" do
            test_hash = {
                :full_q => "TEST FULL QUESTION",
                :full_a => "TEST FULL ANSWER"
            }
            res = Result.new({})
            res.add_full(test_hash)
            expect(res.full_q).to eq("TEST FULL QUESTION")
        end
        it "full question added can be accessed" do
            test_hash = {:full_q => "test"}
            res = Result.new({})
            res.add_full(test_hash)
            expect(res.full_q).to eq("test")
        end
        it "full answer added can be accessed" do
            test_hash = {:full_a => "test"}
            res = Result.new({})
            res.add_full(test_hash)
            expect(res.full_a).to eq("test")
        end
    end

    describe "#clear_results" do
        it "deletes all existing results" do
            25.times {Result.new({})}
            Result.clear_results
            expect(Result.all.count).to eq(0)
        end
    end
end