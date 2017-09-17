module SkriptEvents
  module Ping
    extend Discordrb::EventContainer

	  message(start_with: ".ping") do |event|
  		event.respond("pong!")
	  end
  end
end