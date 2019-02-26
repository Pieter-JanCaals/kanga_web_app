require "yaml"
# require "pry-byebug"

# -- Setting the hashes that will contains an instance of all objects --
events_hash = {}
categories_hash = {}
drinks_hash = {}


# -- Creating methods for the two most common messages --
def message_creating(data)
  print "Creating #{data}..."
end

def message_done
  puts "Done!"
end

# -- Opening the yaml file and assigning it to the variable "seed" --
filepath = File.dirname(__FILE__)
filepath += "/seed.yaml"
seed = YAML.load_file(filepath)


# -- Deleting all databases content --
print "Cleaning database..."
Event.destroy_all
Category.destroy_all
message_done


# -- Creating the events --
message_creating("events")
seed["events"].each do |event|
  temp_event = Event.create!(
    name: event["name"],
    longitude: event["longitude"],
    latitude: event["latitude"],
    address: event["address"],
    start_date: event["start_date"],
    end_date: event["end_date"]
    )
  events_hash[event["name"]] = temp_event
end
message_done


# -- Creating the categories --
message_creating("categories")
seed["categories"].each do |category|
  temp_category = Category.create!(
    name: category["name"]
    )
  categories_hash[category["name"]] = temp_category
end
message_done


# -- Creating the drinks --
message_creating("drinks")
seed["drinks"].each do |drink|
  temp_drink = Drink.create!(
    name: drink["name"],
    prep_time: drink["prep_time"],
    category: categories_hash[drink["category"]]
    )
  drinks_hash[drink["name"]] = temp_drink
end
message_done


# -- All done! --
puts "Finished!!!"
