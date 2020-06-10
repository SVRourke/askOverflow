require 'spec_helper'

RSpec.describe App do
    before(:all) do
        @app = App.new
    end
    describe "#f_query" do
        it "accepts a user inputted string and formats it as a url query" do
            expect(@app.f_query("a b c")).to eq("q=a+b+c")
        end
    end
    describe "#make_url" do
        it "accepts a query and returns a full url" do
            expect(@app.make_url("1 2 3")).to eq("https://stackoverflow.com/search?q=1+2+3+hasaccepted%3Atrue")
        end
    end
end
