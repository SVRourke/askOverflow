require 'rspec'
require 'askoverflow'

RSpec.describe Scrape do
    describe "#new" do
        it "create a new instance of Scrape and takes no initializing arguments" do
            test_scraper = Scrape.new
            expect(test_scraper.class.to_s).to eq("Scrape")
        end
    end
    describe "#getDoc" do
        it "takes a url as argument and returns the html document" do
            url = "https://stackoverflow.com/questions/tagged/ruby"
            test_scraper = Scrape.new
            doc = test_scraper.getDoc(url)
            expect(doc.class.to_s).to eq("Nokogiri::HTML::Document")
        end
    end
    describe "#getSearchResults" do
        it "takes a url as argument and initializes a new Result for each scraped result" do
            url = "https://stackoverflow.com/questions/tagged/ruby"
            test_scraper = Scrape.new
            test_scraper.getSearchResults(url)
            expect(Result.all.count).to be > 0
        end
    end
    describe "#getPostContent" do
        it "takes a result object as an argument, scrapes result.link and adds scraped full q & a to result instance" do
            url = "https://stackoverflow.com/questions/tagged/ruby"
            test_scraper = Scrape.new
            test_scraper.getSearchResults(url)
            res = Result.all.first
            test_scraper.getPostContent(res)
            expect(res.full_a).not_to be nil
        end
    end
end