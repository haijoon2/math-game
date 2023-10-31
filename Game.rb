class Game
  attr_accessor :player1, :player2, :turn, :player1_is_questioner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
    @player1_is_questioner = true
  end

  def who_is_questioner?
    return @player1_is_questioner ? player1 : player2
  end

  def who_is_answerer?
    return @player1_is_questioner ? player2 : player1
  end

  def format_scores
    return "#{player1.name}: #{player1.life}/3 vs #{player2.name}: #{player2.life}/3"
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    return [num1, num2, num1 + num2]
  end

  def change_turn
    @player1_is_questioner = @player1_is_questioner ? false : true
  end
end