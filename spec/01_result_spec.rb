# spec/result_spec.rb
require 'rspec'
require 'askoverflow'
require './askoverflow/result.rb'



RSpec.describe Result do
    describe "#new" do
        it "accepts a hash of values and creates a new Result with supplied values" do
            a = Result.new({:question => "?"})
            expect(a.question).to eq("?")
        end
    end

    describe "#get_result_by_id" do
        it "returns a Result obj with the specified id" do
            4.times {Result.new({})}
            expect(Result.get_result_by_id(3).id).to eq(3)
        end
    end

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
            res.add_content(test_hash)
            expect(res.full_q).to eq("test")
        end
        it "full answer added can be accessed" do
            test_hash = {:full_a => "test"}
            res = Result.new({})
            res.add_content(test_hash)
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