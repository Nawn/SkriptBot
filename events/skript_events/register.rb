module SkriptEvents
  module Register
    extend Discordrb::Commands::CommandContainer

	  command :register  do |event, user|
      discord_user = event.bot.parse_mention(user)
  		if discord_user.is_a?(Discordrb::User)
        Skript::Bot.new_user(discord_user, event)
        next
  		else
        next Skript::Bot.argument_error("User is invalid")
  		end
	  end
  end
end