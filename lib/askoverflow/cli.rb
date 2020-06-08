# Controller
class CLI
    def greet
        puts "askoverflow"
    end

    def prompt_search
        puts "please enter a search or exit: "
    end

    def prompt_result
        puts "enter the id of a result or exit"
    end

    def prompt_return
        puts "back / exit?"
    end

    def display_results
        Result.all.each_with_index do |r, i|
            puts "#{i + 1} ||#{r.question}||#{r.sample}||#{r.tags}||#{r.ask_date}||#{r.answer_count}||#{r.author}"
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++"
        end
    end

    def display_specific(id)
        result = Result.find_by_id(id)
        puts "#{r.full_q}||#{r.full_a}"
    end

    def goodbye
        15.times {puts ""}
        puts "I hope we helped"
        4.times {puts ""}
    end
end


