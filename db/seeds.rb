# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(
    :name => 'Chicken spring roll with soy sauce and sweet chili sauce',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3151/4389.jpeg',
    :price => 46.00
    )
Item.create(
    :name => 'Chicken breaded kofta with pasta red sauce',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3150/4384.jpeg',
    :price => 59.00
    )
Item.create(
    :name => 'Boneless chicken thigh with potato pure',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3149/4383.jpeg',
    :price => 68.00
    )
Item.create(
    :name => 'Bechamil pasta with pane',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3144/4387.jpeg',
    :price => 68.00
    )
Item.create(
    :name => 'Chicken Mushroom & Lemon Sauce, with Rice',
    :image => 'https://www.getmumm.com/uploads/items/328x222/2246/3208.jpeg',
    :price => 57.00
    )
Item.create(
    :name => 'Bechamil pasta with green salad',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3146/4385.jpeg',
    :price => 73.00
    )
Item.create(
    :name => 'Zucchini bechamel with white rice',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3145/4386.jpeg',
    :price => 55.00
    )
Item.create(
    :name => 'Meat mombar with baba ghanouj',
    :image => 'https://www.getmumm.com/uploads/items/328x222/3141/4402.jpeg',
    :price => 61.00
    )
User.create(
    :first_name => 'Ahmed',
    :last_name => 'Elanadoly',
    :email => 'ahmedelanadoly@gmail.com'
    )
User.create(
    :first_name => 'Moaz',
    :last_name => 'Elnager',
    :email => 'Moaz@gmail.com'
    )
User.create(
    :first_name => 'Amr',
    :last_name => 'Arafa',
    :email => 'Amr@gmail.com'
    )
Group.create(
    :creator_id => 1
    )
Group.create(
    :creator_id => 1
    )
Group.create(
    :creator_id => 1
    )
Order.create(
    :user_id => 1,
    :group_id => 1
    )
Order.create(
    :user_id => 1,
    :group_id => 3
    )
Order.create(
    :user_id => 1,
    :group_id => 2
    )
Oder.create(
    :user_id => 2,
    :group_id => 2
    )
OrderItem.create(
    :order_id => 1,
    :item_id => 1,
    :quantity => 4
    )
OrderItem.create(
    :order_id => 1,
    :item_id => 2,
    :quantity => 3
    )
OrderItem.create(
    :order_id => 1,
    :item_id => 3,
    :quantity => 1
    )
OrderItem.create(
    :order_id => 2,
    :item_id => 4,
    :quantity => 1
    )
OrderItem.create(
    :order_id => 2,
    :item_id => 5,
    :quantity => 6
    )
OrderItem.create(
    :order_id => 3,
    :item_id => 1,
    :quantity => 2
    )
OrderItem.create(
    :order_id => 3,
    :item_id => 4,
    :quantity => 5
    )
OrderItem.create(
    :order_id => 3,
    :item_id => 7,
    :quantity => 1
    )

