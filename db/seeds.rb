item = Item.new(
  name: 'macbook',
  price: 3000
)

file = File.open('db/seeds/macbook.jpg')
item.image.attach(io: file, filename: 'mac.jpg')
item.save
