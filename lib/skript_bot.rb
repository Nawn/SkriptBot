module Skript
	class Bot
		def initialize(args)
				
		end

		def self.argument_error(input_string)
			error_message = "```\n"
			error_message += "ARGUMENT ERROR: #{input_string}! Find Master. Ask for help! \n"
			error_message += "```"		
		end

		def self.debug_hash(input_hash)
			return_string = "```\n"
			input_hash.each { |key, value| 
				return_string += "#{key}: #{value}\n"
			}
			return_string += "```"

			return return_string
		end
	end
end