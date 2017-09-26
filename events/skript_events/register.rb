module SkriptEvents
  module Register
    extend Discordrb::Commands::CommandContainer

	  command :register  do |event, user|
      discord_user = event.bot.parse_mention(user)
  		if discord_user.is_a?(Discordrb::User)
        event.channel.send_temporary_message(Skript::Bot.new_user(discord_user, event), 25)
        next
  		else
        next Skript::Bot.argument_error("User is invalid")
  		end
	  end
  end
end