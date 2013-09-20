require 'active_record'


require '../lib/survey'
require '../lib/question'
require '../lib/answer'
require '../lib/user'
require '../lib/responder'
require '../lib/response'
require '../lib/selection'

require './admin'
require './user'

database_configurations = YAML::load(File.open('../db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts `clear`
  puts "Welcome to Survey Monkey!"
  puts "\nAre you a [s]urvey taker or [a]dmin?"
  user_choice = gets.chomp.downcase
  if user_choice == 's'
    user_menu
  elsif user_choice == 'a'
    admin_menu
  else
   puts "That is not a valid option"
   welcome
 end
end





welcome