module SkriptEvents
  module Register
    extend Discordrb::Commands::CommandContainer

	  command :register  do |event, user|
      discord_user = event.bot.parse_mention(user)
  		if discord_user.is_a?(Discordrb::User)
        input_hash = {
          "User Name" => "#{discord_user.username}",
          "User ID" => "#{discord_user.id}",
          "Skript URL" => "#{Skript::Bot.website_url}"
        }

  			next Skript::Bot.debug_hash(input_hash)
  		else
        next Skript::Bot.argument_error("User is invalid")
  		end
	  end
  end
end