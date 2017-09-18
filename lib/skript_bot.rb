require "rest-client"

module Skript
	class Bot
		@website_url = "http://192.168.1.18:3000"
		@api_key = "test"

		class << self
			attr_accessor :website_url, :api_key
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

		def self.new_user(discord_user)

			query_params = {
				"bot_key" => "#{Skript::Bot.api_key}",
				"discord_id" => "#{discord_user.id}",
				"discord_nick" => "#{discord_user.username}"
			}

			# Base URL for a new user
			query_url = "#{Skript::Bot.website_url}/user/new?"

			# For each param, add it as a URL Param
			query_params.each do |key, value|
				query_url += "#{key}=#{value}&"
			end

			# Because of the previous bit (Iteration on the params)
			# The last one should be an & character.
			# So, remove it. 
			query_url[-1] = ""

			response = RestClient.get(query_url)

			Skript::Bot.debug_hash({"response" => response})
		end
	end
end