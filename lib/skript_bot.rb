module Skript
	class Bot
		def initialize(args)
				
		end

		def self.argument_error(input_string)
			error_message = "```\n"
			error_message += "ARGUMENT ERROR: #{input_string}! Find Master. Ask for help! \n"
			error_message += "```"		
		end
	end
end