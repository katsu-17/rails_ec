# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
item = Item.create(
  name: 'macbook',
  price: 3000
)
item.image.attach(io: File.open(Rails.root.join('public/assets/macbook-16daa50489c25572a85aca8e1e7d4292caf2cb33a3ac689e8e0c3dd0a82cd655.jpg'), filename: 'macbook.jpg'))
