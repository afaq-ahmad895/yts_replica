require 'pry'
require 'yaml'

data= YAML.load_file('nested_hash.yml')

puts "Person Detail :"
puts "  Name =>  #{data['person_detail']['name'].capitalize} -> #{data['person_goal']['name'].capitalize}"
puts "  Job => #{data['person_detail']['job']} -> #{data['person_goal']['job']}"
puts "  Skill => #{data['person_detail']['skill']} -> #{data['person_goal']['skill']}"
puts "Person Address :"
puts "  #{data['person_address']['street']} #{data['person_address']['city']} #{data['person_address']['country']}"
