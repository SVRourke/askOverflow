# Controller
class CLI
    # =======================
    # ====DISPLAY=METHODS====
    # =======================
    def display_results
        15.times {puts ""}
        puts"Results"
        puts"===================================="
        puts"(1) blah blah blah blah 8 answers"
        puts"===================================="
        puts"(2) blah blah blah blah 67 answers"
        puts"===================================="
        puts"(3) blah blah blah blah 41 answers"
        puts"===================================="
        puts"(4) blah blah blah blah 10 answers"
        puts"===================================="
    end

    def display_specific(result)
        15.times {puts ""}
        puts "Q"
        puts "sldjfslkdnflksfgkdfvdfbgdB?"
        puts " "
        puts "A"
        puts "dflkgnsdflgsldkgmb;dsmaf;lms;df"
        puts " "
    end

    def greet_user
        10.times {puts ""}
        puts "askoverflow"
        4.times {puts ""}
    end

    def goodbye
        15.times {puts ""}
        puts "I hope we helped"
        4.times {puts ""}
    end


    # =======================
    # ====HELPER=METHODS=====
    # =======================
    def prompt_query
        puts "enter a search"
    end

    def prompt_result
        3.times {puts ""}
        puts "Which would you like to read"
    end

    def prompt_return
        3.times {puts "====================="}
        puts "back / exit?"
    end

end


