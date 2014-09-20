###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret
# number game. In this game players have three tries to guess a secret number
# between 1 and 10.
#
# Here are some guidelines to building your game:
#
#   Intros
#   - Welcome the player to your game. Let them know who created the game.
#   - Ask for the player's name then personally greet them by printing to the
#     screen, "Hi player_name!"
#   - Any good game will communicate the rules. Let the player know they must
#     guess a number between 1 and 10 and that they only have 3 tries to do so.
#
#   Functionality:
#     - Manually specify the secret number in a variable. Choose a random 
#       number between 1 and 10.
#     - Ask the user for their guess.
#     - Verify if they were correct. If the player guesses correctly they win
#       the game, they should be congratulated and the game should end.
#     - If they guess incorrectly, give the player some direction. If they
#       guess too high let them know, if they guess too low, let them know.
#     - Don't forget to let your players know how many guesses they have left.
#       Your game should say something like:
#         "You have X guesses before the game is over enter a another number"
#     - If they don't guess correctly after 3 tries, display that the player
#       lost and that the game is over. Be nice and let them know what the
#       `secret_number` was.
#
###############################################################################


def nameplayer
  gets.strip
end

def game

  secret_number = 4

  user_number = gets.strip.to_i

  if user_number == secret_number
    puts 'How about that? You got it right!!!'
  end

  if user_number > secret_number
    puts 'Whoa, slow down there, cowboy. Think a little smaller.'
    game
  end

  if user_number < secret_number
    puts 'Don\'t be afraid to dream a little bigger, darling.'
    game
  end

  if user_number != Integer
    puts 'Did I say this was the secret \"LETTER\" game?? NO!'
    game
  end
end


puts 'Hello there! Welcome to the Secret Number game, created by Brandon.'
puts 'What\'s your name?'
name = nameplayer
puts "Great to meet you, #{name}!"
puts 'Let\'s play the Secret Number game! The rules are pretty simple.'
puts 'You\'ll have THREE chances to guess the number that I\'m thinking of,'
puts 'which is a number between 1 and 10.'
puts 'Are you ready to begin? Type in a number!'

game

puts 'THE END.'

  
