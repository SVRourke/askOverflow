# require 'rspec'
require 'spec_helper'
require 'pry'
RSpec.describe Scrape do
    before(:all) do
        @scrape = Scrape.new
        @url = "https://stackoverflow.com/search?q=%22ruby%22"
    end

    describe "#new" do
        it "create a new instance of Scrape and takes no initializing arguments" do
            expect(@scrape.class.to_s).to eq("Scrape")
        end
    end
    describe "#getDoc" do
        it "takes a url as argument and returns the html document" do
            doc = @scrape.getDoc(@url)
            expect(doc.class.to_s).to eq("Nokogiri::HTML::Document")
        end
    end
    describe "#scrape_results" do
        it "takes a url as argument and initializes a new Result for each scraped result" do
            @scrape.scrape_results(@url)
            binding.pry
            puts Result.all.count
            expect(Result.all.count).to be > 0
        end
    end
    describe "#scrape_specific" do
        it "takes a result object as an argument, scrapes result.link and adds scraped full q & a to result instance" do
            @scrape.scrape_specific(Result.all.first)
            expect(Result.all.first.full_a).not_to be nil
        end
    end
end