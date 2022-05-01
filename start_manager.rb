require './lib/moves_validate'
require './lib/board'
require './lib/square'
require './lib/piece'
require './lib/pawn'
# require 'byebug'


class StartManager
  attr_accessor :pawn

  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end

  def pawn_simulator
    loop do
      puts "Enter an input :"
      puts "Please see an example input like: "
      puts "Must begin with something like PLACE 0,0,NORTH,WHITE "
      puts "Followed by MOVE (position) which must be valid and can be entered n times"
      user_input =  @input.gets
      user_input = user_input.chomp.strip() if user_input
      command, options = command_formatting(user_input)

      if !@pawn && (command && command != PLACE)
        @output.puts "The first valid command to the pawn is a `#{PLACE}` command."
        return
      end

      puts "====Checking pawn === #{@pawn}"
      case command
      when PLACE
        error_message = validate_place_cmd(options)

        if error_message
          @output.puts error_message
          return
        end

        x,y,f,c = options
        @pawn = Pawn.new(x.to_i, y.to_i, f.upcase, c.upcase)
      when MOVE
        steps = options[0] || 1
        puts "===== Checking steps ==== #{steps.inspect}"
        @pawn.move(steps.to_i)
      when LEFT
        @pawn.left
      when RIGHT
        @pawn.right
      when REPORT
        @output.puts "Output: #{@pawn.report}"
        return
      end
    end
  end
end

start_pawn = StartManager.new()
start_pawn.pawn_simulator