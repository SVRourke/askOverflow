class ScrapeParse

    def getDoc(url)
        Nokogiri::HTML(open(url))
    end

    def getSearchResults(url)
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

    def getPostContent(url)
        puts "NOT DONE"
    end
end