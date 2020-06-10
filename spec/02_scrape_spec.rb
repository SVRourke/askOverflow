# require 'rspec'
require 'spec_helper'
# require 'askoverflow'
require 'pry'
RSpec.describe Scrape do
    before(:all) do
        @url = "https://stackoverflow.com/search?q=%22ruby%22"
        @s = Scrape.new
        @s.scrape_results(@url)
        @s.scrape_specific(Result.all.first)

    end

    describe "#new" do
        it "create a new instance of Scrape and takes no initializing arguments" do
            expect(@s.class.to_s).to eq("Scrape")
        end
    end
    describe "#getDoc" do
        it "takes a url as argument and returns the html document" do
            document = @s.getDoc(@url)
            expect(document.class.to_s).to eq("Nokogiri::HTML::Document")
        end
    end
    describe "#scrape_results" do
        it "takes a url as argument and initializes a new Result for each scraped result" do
            # a = Scrape.new
            # @s.scrape_results(@url)
            expect(Result.all.count).not_to eq(0)
        end
    end
    describe "#scrape_specific" do
        it "takes a result object as an argument, scrapes result.link and adds scraped full q & a to result instance" do
            # @scrape.scrape_specific(Result.all.first)
            expect(Result.all.first.full_a).not_to be nil
        end
    end
end