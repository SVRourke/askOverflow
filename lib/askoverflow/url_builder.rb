class UrlBuilder
    def fquery(raw)
        fq = raw.gsub(" ", "+")
        return "q=#{fq}"
    end

    def make_url(query)
        base = 'https://stackoverflow.com/search?'
        q = fquery(query)
        answeredOnly = "+hasaccepted%3Atrue"
        return "#{base}#{q}#{answeredOnly}"
    end
end
