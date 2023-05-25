# frozen_string_literal: true

Item.create(
  name: 'macbook',
  price: 3000,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('db/seeds/macbook.jpg')), filename: 'a')
)
