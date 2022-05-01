# Valid commands
PLACE    = "PLACE"
MOVE     = "MOVE"
LEFT     = "LEFT"
RIGHT    = "RIGHT"
REPORT   = "REPORT"
COMMANDS = [PLACE, MOVE, LEFT, RIGHT, REPORT]

# Faces
NORTH  = "NORTH"
SOUTH  = "SOUTH"
EAST   = "EAST"
WEST   = "WEST"
FACING = [NORTH, SOUTH, EAST, WEST]

FACINGS = [EAST, SOUTH, WEST, NORTH]

# Colors
WHITE = "WHITE"
BLACK = "BLACK"
COLOR = [WHITE, BLACK]


def validate_place_cmd(options)
  	if options.length != 4
  		return "`Place` argument should be `X,Y,F,C` format."
  	end

  	x,y,f,c = options
  	unless x.to_i.is_a?(Integer) or y.to_i.is_a?(Integer)
  		return "x and y position should be integer value."
  	end

  	unless FACING.include?(f&.upcase)
  		return "Facing should be #{FACING.join(" or ")}."
  	end

  	unless COLOR.include?(c&.upcase)
  		return "Color should be #{COLOR.join(" or ")}."
  	end
end

def command_formatting(answer)
	command, *args = answer.to_s.gsub(/\s*,\s*/, ",").split()
	command.to_s.upcase!

	options = args[0].to_s.split(",")
	return command, options
end