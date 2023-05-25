# frozen_string_literal: true

Item.create(
  name: 'macbook',
  price: 3000,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open('db/seeds/macbook.jpg'), filename: 'mac.jpg')
)
