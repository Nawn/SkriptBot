module SkriptEvents
  module NewMem
    extend Discordrb::EventContainer
    
    #When someone new joins in, greet them
    member_join() do |event|
      the_role = event.roles.find { |role| role.name == "Initiate" }
      event.user.roles = the_role
    end
  end
end