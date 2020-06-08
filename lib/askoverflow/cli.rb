class CLI
    # greet, called at program start, greets the user
    def greet
        puts "askoverflow"
    end
    # displays a thankyou message for the user after exit
    def goodbye
        10.times {visual_spacer}
        puts "Thanks for using AskOverflow-"
        puts "I hope we helped"
        visual_spacer
    end
    # Helper function used to simplify displaying messages
    # in a visually pleasing way
    def visual_spacer
        3.times {puts ""}
    end
    # prompt functions used to print requests for user input
    # asks the user to search or exit
    def prompt_search
        puts "please enter a search or exit: "
    end
    # asks user for the id number of their desired result
    def prompt_result
        puts "enter the id of a result to read further, back to do a new search or exit to quit"
    end
    # asks user to press enter to return to the results page
    def prompt_return
        visual_spacer
        puts "+++enter to return to results+++"
        visual_spacer
        gets
    end
    # after displaying the full question text
    # asks user to press enter to display the answer
    def prompt_next
        visual_spacer
        puts "Press enter to read answer"
        visual_spacer
        gets
    end
    # Display functions, used to display data to the user
    # display_results displays each result's basic info
    def display_results
        Result.all.each_with_index do |r, i|
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++"
            puts "|ID:#{i + 1}| #{r.question.slice(0,60)}..."
            puts "|#{r.answer_count} answer(s) since: #{r.ask_date}"
            puts "|Tags:\t#{r.tags}"
            puts "++++++++++++++++++++++++++++++++++++++++++++++++++"
            puts ""
        end
    end
    # after a result is selected, this displays the result's full question
    def display_question(result)
        10.times {visual_spacer}
        puts "++++++++++++++++++++++++++"
        puts "+++++++++QUESTION+++++++++"
        puts "++++++++++++++++++++++++++"
        puts "#{result.full_q}"
    end
    # after a result is selected and the question has been displayed,
    # this displays the result's full answer.
    def display_answer(result)
        4.times {visual_spacer}
        puts "++++++++++++++++++++++++++"
        puts "++++++++++ANSWER++++++++++"
        puts "++++++++++++++++++++++++++"
        puts "#{result.full_a}"
    end
end


