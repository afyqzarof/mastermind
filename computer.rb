require 'colorize'
class ComputerMaker
    
    def random_four
        @computer_maker_array = []
        4.times do |i|
            i = rand(1..6)
            @computer_maker_array << i
        end
        @computer_maker_array
    end
end

class PlayerGuess
    def get_guess
        puts "Enter guess (4 digit number): "
        @player_guess = gets.chomp
        if @player_guess.length == 4
            @player_guess_array = @player_guess.split("") #note: number in array are strings
        else   
            p "Please try again"
            get_guess()
        end
    end
end

class Game
    attr_reader :computer_array, :player_guess
    
    def initialize
        @computer_array = ComputerMaker.new().random_four
        #p @computer_array
        @player_guess = PlayerGuess.new().get_guess
    end

    #there a weird bug where multiple same guesses messes up the output if answer has multiple same numbers (ans: 1123 guess: 2112)
    def compare
        @temp_comp_ans = [1, 1, 2, 3]
        #p @temp_comp_ans
        @colored_output = ["gray", "gray", "gray", "gray",]

        @player_guess.each_with_index do |player_guess, player_index|
            if player_guess == @temp_comp_ans[player_index].to_s
                @colored_output[player_index] = "green"
                @temp_comp_ans[player_index] = nil
                #@player_guess[player_index] = "empty"
                #p "player: #{@player_guess}"
                #p "comp: #{@temp_comp_ans}"
            end
        end
        #p @temp_comp_ans

        @player_guess.each_with_index do |player_guess, player_index|     
            if @temp_comp_ans.include?(player_guess.to_i) && player_guess != @computer_array[player_index].to_s
                @colored_output[player_index] = "yellow"
                #p "first: #{@temp_comp_ans}"
                #@temp_comp_ans[player_index] = nil
                #p "second: #{@temp_comp_ans}"
            elsif @temp_comp_ans[player_index] == nil or @player_guess[player_index] == "empty"
                next
            end
        end
        p @colored_output
    end
end


newGame = Game.new()
newGame.compare

# newGame.player_guess
#player = PlayerGuess.new()
#p player.get_guess
# computer_choice = ComputerMaker.new()
# p computer_choice.random_four


#arr = [ "I am now red".yellow]

#p arr[0]
