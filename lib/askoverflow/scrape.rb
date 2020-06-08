# require 'pry'
class Scrape
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
        result.add_full({
            :full_q => doc.css("div.question div.postcell div.post-text").text,
            :full_a => doc.css("div.answer div.answercell div.post-text").text
        })
    end
end
# binding.pry