class WheelOfFortune
  attr_accessor :guesses
  attr_reader :theme, :phrase

  def initialize(hash)
      @phrase = hash[:phrase]
      @theme = hash[:theme]
      @guesses = []
  end

  def theme
    @theme
  end

  def can_i_have?(input)
    input.downcase!
    @guesses << input
    return @phrase.downcase.include? input
  end

  def to_s
    @phrase.gsub(/[^#{@guesses.join()}\s]/i, "_")
  end


  def game_over?
    return @phrase.gsub(/[^#{@guesses.join()}\s]/i, "_") == @phrase ? true : false
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
