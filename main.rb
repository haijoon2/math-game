require './Player'
require './Game'

print "Name of the player 1: "
name_player1 = gets.chomp
player1 = Player.new(name_player1)

print "Name of the player 2: "
name_player2 = gets.chomp
player2 = Player.new(name_player2)

game = Game.new(player1, player2)

begin
  puts game.format_scores

  questioner = game.who_is_questioner?
  answerer = game.who_is_answerer?
  question = game.generate_question

  puts "#{questioner.name}: What does #{question[0]} plus #{question[1]} equal?"
  answer = gets.chomp.to_i

  if answer == question[2]
    puts "#{questioner.name}: YES! You are correct."
  else
    puts "#{questioner.name}: Seriously? No!"
    answerer.lose_life
  end

  game.change_turn
  puts "----- NEW TURN -----"

end while game.player1.life > 0 && game.player2.life > 0

puts "Final score: #{player1.name}: #{player1.life}/3 vs #{player2.name}: #{player2.life}/3"
winner = player1.life > player2.life ? player1 : player2
puts "#{winner.name} wins!"
puts "----- GAME OVER -----"