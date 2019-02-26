require "yaml"
# require "pry-byebug"

def message_creating(data)
  print "Creating #{data}..."
end

def message_done
  puts "Done!"
end

# -- Sets the yaml file to the variable "seed" --
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
  Event.create!(
    name: event["name"],
    longitude: event["longitude"],
    latitude: event["latitude"],
    address: event["address"],
    start_date: event["start_date"],
    end_date: event["end_date"]
    )
end

message_done


# -- Creating the categories --
message_creating("categories")
categories_array = []
seed["categories"].each do |category|
  categories_array << category["name"]
  Category.create!(
    name: category["name"]
    )
end
message_done



# All done!
puts "Finished!!!"
