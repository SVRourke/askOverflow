# require 'pry'
class Scrape
    def initialize
        puts 'hello'
    end

    def getDoc(url)
        Nokogiri::HTML(open(url))
    end

    def scrape_results(url)
        doc = getDoc(url)
        doc.css("div.search-result").each do |result|
            Result.new({
                :question => result.css(".question-hyperlink").text.strip,
                :sample => result.css("div.excerpt").text.strip,
                :ask_date => result.css("span.relativetime").text.strip,
                :tags => result.css("div.tags").text.strip,
                :answer_count => result.css("div.status strong").text.strip,
                :author => result.css("div.started a").text.strip,
                :link => result.css("a.question-hyperlink").first['href']
            })
        end
    end

    def scrape_specific(result)
        doc = getDoc("https://stackoverflow.com/#{result.link}")
        question = doc.css("div.question div.postcell div.post-text").text
        answer = doc.css("div.answer div.answercell div.post-text").text
        result.add_content({
            :full_q => question,
            :full_a => answer
        })
    end
end
# binding.pry