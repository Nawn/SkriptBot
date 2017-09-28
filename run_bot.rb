#requires the library used to contact Discord
#Windows fix ↓ to allow audio for discordrb
#::RBNACL_LIBSODIUM_GEM_LIB_PATH = "C:/libsodium.dll"

require 'discordrb'
# require_relative 'lib/generic_bot'
require_relative 'lib/skript_bot'

#Grab all the folders in the Events directory, for each of them
Dir.glob('events/*').select {|f| File.directory? f}.each do |folder_path|
  #For each rb file (which contains an event handler)
  Dir["#{folder_path}/**/*.rb"].each do |file_path|
    #Require the file.
    require_relative file_path
  end
end

#Generic Bot
# bot = Discordrb::Bot.new token: ENV["DIS_TOKEN_ID"], client_id: ENV["DIS_CLIENT_ID"]

skript = Discordrb::Commands::CommandBot.new token: 'MzU3OTc5NDYwMzYxOTEyMzIw.DJ-QJA.VY9I9N4fr8zsxtSeHqZHnN5ajJQ', client_id: 357979460361912320, prefix: '.'

#This is a hash containing the bot that I just declared, and the appropriate module (Which contains sub-modules that contain event handlers.)
# {bot => GeneralEvents, skript => SkriptEvents}.each do |the_bot, the_module|
{skript => SkriptEvents}.each do |the_bot, the_module|
  #For each inner-module (that contains handlers)
  the_module.constants.each do |input_module|
    #Include it into bot (so that it handles the events)
    the_bot.include! the_module.const_get(input_module)
  end
end

#Create 2 threads to run the bots
#gen_bot = Thread.new {bot.run}
#gen_bot.join

# Create second thread to host skript
gen_bot_two = Thread.new {
  # Set role permissions
  # In order: Initiate, Guild Member, Jr Officer, Sr Officer
  # The Other Guy, and Bots
  skript.set_role_permission(337062826801758210, 0)
  skript.set_role_permission(337062083654844418, 1)
  skript.set_role_permission(337061672940339201, 2)
  skript.set_role_permission(337061298233933824, 3)
  skript.set_role_permission(337060888068751363, 4)
  skript.set_role_permission(329123897825951746, 5)

  skript.run

## Should you ever wish to inspect servers Roles, 
#  simply place the server ID and let the magic happen
# 
#  skript.servers[328738686650810369].roles.each { |role|
#    puts "Role Name: #{role.name}"
#    puts "Role ID: #{role.id}"
#    puts "\n\n"
#  }
}
gen_bot_two.join