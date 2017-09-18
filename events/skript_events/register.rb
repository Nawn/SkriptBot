module SkriptEvents
  module Register
    extend Discordrb::Commands::CommandContainer

	  command :register  do |event, user|
  		if event.bot.parse_mention(user).is_a?(Discordrb::User)
  			"That's right!"
  		else
        Skript::Bot.argument_error("User is invalid")
  		end
	  end
  end
end