require "yaml"

# -- Creating methods for the two most common messages --
def message_creating(data)
  print "Creating #{data}..."
end

def message_done
  puts "Done!"
end


# -- Deleting all databases content --
print "Cleaning database..."
OrderDrink.destroy_all
BarDrink.destroy_all
Drink.destroy_all
Order.destroy_all
Bar.destroy_all
Category.destroy_all
User.destroy_all
Event.destroy_all
message_done


# -- Creating the hashes that will contains an instance of all created objects --
events_hash = Hash.new
categories_hash = Hash.new
drinks_hash = Hash.new
bars_hash = Hash.new
users_hash = Hash.new


# -- Opening the yaml file and assigning it to the variable "seed" --
filepath = File.dirname(__FILE__)
filepath += "/seed.yaml"
seed = YAML.load_file(filepath)


# -- Creating the events --
message_creating("events")
seed["events"].each do |event|
  temp_event = Event.create!(
    name: event["name"],
    longitude: event["longitude"],
    latitude: event["latitude"],
    address: event["address"],
    remote_photo_url: event["photo"],
    remote_logo_url: event["logo"],
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
    price_cents: drink["price"],
    category: categories_hash[drink["category"]]
    )
  drinks_hash[drink["name"]] = temp_drink
end
message_done


# -- Creating the bars --
message_creating("bars")
seed["bars"].each do |bar|
  temp_bar = Bar.create!(
    name: bar["name"],
    longitude: bar["longitude"],
    latitude: bar["latitude"],
    event: events_hash[bar["event"]]
  )
  bars_hash[bar["name"]] = temp_bar
end
message_done


# -- Creating the bar_drinks --
message_creating("bar_drinks")
bars_hash.each do |bar_key, bar_value|
  drinks_hash.each do |drink_key, drink_value|
    BarDrink.create!(
    drink: drink_value,
    bar: bar_value
    )
  end
end
message_done


# -- Creating the users --
message_creating("users")
seed["users"].each do |user|
  temp_user = User.create!(
    email: user["email"],
    password: user["password"]
    )
  users_hash[user["email"]] = temp_user
end
message_done


# -- Creating orders --
message_creating("orders")
bars_hash.each do |bar_key, bar_value|
  id = 2
  3.times do
    temp_order = Order.create!(
      status: "confirmed",
      user: (users_hash.values)[id],
      qr_code: DateTime.now.strftime('%Q'),
      bar: bar_value,
      tip: 15
      )
    OrderDrink.create!(
      order: temp_order,
      drink: drinks_hash.values.sample,
      amount: 5,
      user: (users_hash.values)[id]
      )
    OrderDrink.create!(
      order: temp_order,
      drink: drinks_hash.values.sample,
      amount: 3,
      user: (users_hash.values)[id]
      )
    OrderDrink.create!(
      order: temp_order,
      drink: drinks_hash.values.sample,
      amount: 2,
      user: (users_hash.values)[id - 1]
      )
    id += 1
  end
end
message_done


# -- All done! --
puts "Finished!!!"


#
