# frozen_string_literal: true

Item.create(
  name: 'cup',
  price: 1200,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open('db/seeds/cup.jpg'), filename: 'cup.jpg')
)
