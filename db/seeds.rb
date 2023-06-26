# frozen_string_literal: true

item = Item.new(
  name: 'cup',
  price: 400
)
item.image.attach(
  io: File.open(Rails.root.join('db/seeds/cup.jpg')),
  filename: 'cup.jpg',
  content_type: 'image/jpeg'
)
item.save!

item = Item.new(
  name: 'book',
  price: 1000
)
item.image.attach(
  io: File.open(Rails.root.join('db/seeds/book.jpg')),
  filename: 'book.jpg',
  content_type: 'image/jpeg'
)
item.save!

item = Item.new(
  name: 'Macbook',
  price: 10_000
)
item.image.attach(
  io: File.open(Rails.root.join('db/seeds/macbook.jpg')),
  filename: 'macbook.jpg',
  content_type: 'image/jpeg'
)
item.save!
