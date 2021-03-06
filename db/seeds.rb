Category.create(name: "Classics")
Category.create(name: "Savory")
Category.create(name: "So Good and So Unhealthy")
Category.create(name: "I Can't Believe It's Good For Me")
Category.create(name: "You Put That In A Pie?")

Item.create(title: "Awesome Apple", description: "Local, organically grown apples, gluten-free",
 inventory: 10, price_pie: 12.99, category_ids: [1, 4])
Item.create(title: "Key-Lime", description: "Local, organically grown limes, gluten-free",
 inventory:12, price_pie: 17.99, category_ids:[1, 4])
Item.create(title: "Peach", description: "Local farm-fresh peaches, homemade whipcream",
 inventory:3, price_pie: 23.99, category_ids:[1, 3])
Item.create(title: "Banana", description: "Imported bananas, homemade filling",
 inventory:5, price_pie: 23.99, category_ids:[1, 3])
Item.create(title: "Berry", description: "Three berry blend, of in-season, local berries",
 inventory: 4, price_pie: 29.99, category_ids: [1])
Item.create(title: "Steak Mushroom", description: "Grass-fed cows, tender steak, mushrooms, onions, special sauce",
 inventory: 5, price_pie: 35.99, category_ids:[2, 3])
Item.create(title: "Chicken Pie", description: "Free-range chicken, vegies, and a tangy sauce",
 inventory: 10, price_pie: 33.99, category_ids: [2, 3])
Item.create(title: "Steak Chilli", description: "Grass-fed cows, tender steak, kidney beans, gluten-free",
 inventory: 10, price_pie: 33.99, category_ids:[2, 1])
Item.create(title: "Sausage Tomato Fennel", description: "Italian sausage, spices, pepper, tomatos",
 inventory: 12, price_pie: 31.15, category_ids:[2, 3])
Item.create(title: "Meat Lovers", description: "It's a heart-attack, for the serious meat-lover",
 inventory: 12, price_pie: 36.99, category_ids:[2, 5])
Item.create(title: "Polka Pie", description: "Keilbasa, sauerkraut, cheese, potatoes",
 inventory: 15, price_pie: 30.99, category_ids: [3])
Item.create(title: "Five Cheese", description: "Sharp-Cheddar, pepper-jack, blue-cheese, gruyere, gouda",
 inventory: 15, price_pie: 30.99, category_ids:[3, 5])
Item.create(title: "Double Chocolate", description: "Cream filled goo with chocolate chips, chocalate mousse",
 inventory: 5, price_pie: 30.99, category_ids:[3, 5])
Item.create(title: "Coconut Cream", description: "Rich coconut cream filling, gluten-free cookie crust",
 inventory: 12, price_pie: 30.99, category_ids:[3, 1])
Item.create(title: "Turtle Pie", description: "Dark chocolate cream filling, pecans, carmel drizzle",
 inventory: 12, price_pie: 30.99, category_ids:[3])
Item.create(title: "Vegan Chili", description: "Brown rice, vegies, rich tomato sauce",
 inventory: 15, price_pie: 30.99, category_ids: [4])
Item.create(title: "Ratatouille", description: "Winter vegetables, stewed in zesty tomato sauce, vegan",
 inventory: 15, price_pie: 30.99, category_ids:[4])
Item.create(title: "Roasted Veggie", description: "Mushrooms, onions, peppers, broccoli, potatoes",
 inventory: 12, price_pie: 30.99, category_ids:[4])
Item.create(title: "No Sugar Added Peach Pie", description: "Tons of peaches without added sugar",
 inventory: 12, price_pie: 30.99, category_ids:[4, 1])
Item.create(title: "No Sugar Added Lemon Pie", description: "Face wrinkling lemons, for the serious lemon lover",
 inventory: 12, price_pie: 30.99, category_ids:[4, 5])
Item.create(title: "Breakfast Pie", description: "6 eggs, hashbrowns, pancakes, and bacon",
 inventory: 15, price_pie: 30.99, category_ids: [5])
Item.create(title: "Lemon Chess", description: "Lemon zest, lemon juice, eggs, cornmeal, sugar crust",
 inventory: 15, price_pie: 30.99, category_ids:[5])
Item.create(title: "Lunch Pie", description: "Free-range chicken, tomatoes, pickles, cheese",
 inventory: 12, price_pie: 30.99, category_ids:[5])
Item.create(title: "Baltimore Bomb", description: "Berger Cookies, vanilla chess filling",
 inventory: 12, price_pie: 30.99, category_ids:[5])
Item.create(title: "Elvis Pie", description: "Peanut butter, bacon, bananas, and chocolate",
 inventory: 12, price_pie: 30.99, category_ids:[5])

Order.create(user_id: 1, order_total: 15, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 1, order_total: 16, order_type: "delivery", delivery_address: "1520 Blake Street, Denver, CO", order_status: "cancelled")
Order.create(user_id: 2, order_total: 17, order_type: "pick-up", delivery_address: nil, order_status: "ordered")
Order.create(user_id: 3, order_total: 35, order_type: "pick-up", delivery_address: nil, order_status: "ordered")
Order.create(user_id: 4, order_total: 45, order_type: "pick-up", delivery_address: nil, order_status: "cancelled")
Order.create(user_id: 4, order_total: 34, order_type: "delivery", delivery_address: "1510 Blake Street, Denver, CO", order_status: "completed")
Order.create(user_id: 3, order_total: 78, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 2, order_total: 88, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 4, order_total: 34, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 3, order_total: 12, order_type: "pick-up", delivery_address: nil, order_status: "completed")

OrderItem.create(order_id: 1, item_id: 2)
OrderItem.create(order_id: 2, item_id: 4)
OrderItem.create(order_id: 3, item_id: 5)
OrderItem.create(order_id: 4, item_id: 6)
OrderItem.create(order_id: 5, item_id: 7)
OrderItem.create(order_id: 6, item_id: 8)
OrderItem.create(order_id: 7, item_id: 9)
OrderItem.create(order_id: 8, item_id: 10)
OrderItem.create(order_id: 9, item_id: 11)
OrderItem.create(order_id: 10, item_id: 12)

User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", role: :user, display_name: nil)
User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", role: :user, display_name: "novohispano")
User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", password: "password", display_name: "josh", role: :admin)
