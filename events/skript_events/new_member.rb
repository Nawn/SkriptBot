module SkriptEvents
  module NewMem
    extend Discordrb::EventContainer
    
    #When someone new joins in, greet them
    member_join() do |event|
      the_role = event.server.roles.find { |temp_role| temp_role.name == "Initiate" }
      puts "The Role: #{the_role}"

      event.user.roles = [the_role]
    end
  end
end