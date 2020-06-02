# spec/result_spec.rb
require 'rspec'
require 'askoverflow'


RSpec.describe Result do
    describe "#new" do
        it "accepts a hash of attributes and creates a new Result object from the hash." do
            test_hash = { 
                :question => "Q",
                :sample => "text sample",
                :tags => ['a', 'b', 'c']
                }
            test_result = Result.new(test_hash)
            expect(test_result.question).to eq("Q")
        end
        it "assigns a unique id to each Result object." do
            5.times {Result.new({})}
            ids = Result.all.collect {|r| r.id}
            expect(ids.count).to eq(ids.uniq.count)
        end
    end

    describe "#all" do
        it "returns a list of all Result objects.\n " do
            4.times {Result.new({})}
            expect(Result.all.count).to eq(10)
        end
    end

    describe "#add_content" do
        it "accepts a hash of additional data and adds it to the Result" do
            test_hash = {
                :full_q => "TEST FULL QUESTION",
                :full_a => "TEST FULL ANSWER"
            }
            res = Result.new({})
            res.add_content(test_hash)
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
end