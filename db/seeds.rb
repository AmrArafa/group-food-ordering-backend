# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(
    :name => 'Chicken spring roll with soy sauce and sweet chili sauce',
    :image => File.open(File.join(Rails.root, '/image/Chicken_spring_roll_with_soy_sauce_and_sweet_chili_sauce.jpg')),
    :price => 46.00
    )
Item.create(
    :name => 'Chicken breaded kofta with pasta red sauce',
    :image => File.open(File.join(Rails.root, '/image/Chicken_breaded_kofta_with_pasta_red_sauce.jpg')),
    :price => 59.00
    )
Item.create(
    :name => 'Boneless chicken thigh with potato pure',
    :image => File.open(File.join(Rails.root, '/image/Boneless_chicken_thigh_with_potato_pure.jpg')),
    :price => 68.00
    )
Item.create(
    :name => 'Bechamil pasta with pane',
    :image => File.open(File.join(Rails.root, '/image/Bechamil_pasta_with_pane.jpg')),
    :price => 68.00
    )
Item.create(
    :name => 'Chicken Mushroom & Lemon Sauce, with Rice',
    :image => File.open(File.join(Rails.root, '/image/Chicken_Mushroom_&_Lemon_Sauce_with_Rice.jpg')),
    :price => 57.00
    )
Item.create(
    :name => 'Bechamil pasta with green salad',
    :image => File.open(File.join(Rails.root, '/image/Bechamil_past_with_green_salad.jpg')),
    :price => 73.00
    )
Item.create(
    :name => 'Zucchini bechamel with white rice',
    :image => File.open(File.join(Rails.root, '/image/Zucchini_bechamel_with_white_rice.jpg')),
    :price => 55.00
    )
Item.create(
    :name => 'Meat mombar with baba ghanouj',
    :image => File.open(File.join(Rails.root, '/image/Meat_mombar_with_baba_ghanouj.jpg')),
    :price => 61.00
    )
Admin.create(
    :first_name => 'Ahmed',
    :last_name => 'Elanadoly',
    :email => 'ahmedelanadoly@gmil.com',
    :password => '123456789',
    :password_confirmation => '123456789'
    )
# User.create(
#     :first_name => 'Ahmed',
#     :last_name => 'Elanadoly',
#     :email => 'ahmedelanadoly@gmail.com'
#     )
# User.create(
#     :first_name => 'Moaz',
#     :last_name => 'Elnager',
#     :email => 'Moaz@gmail.com'
#     )
# User.create(
#     :first_name => 'Amr',
#     :last_name => 'Arafa',
#     :email => 'Amr@gmail.com'
#     )
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
Order.create(
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

