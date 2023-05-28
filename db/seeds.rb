# frozen_string_literal: true

item = Item.new(
  name: 'cup',
  price: 1000
)
item.image.attach(
  io: File.open(Rails.root.join('db/seeds/cup.jpg')),
  filename: 'cup.jpg',
  content_type: 'image/jpeg'
)
item.save
