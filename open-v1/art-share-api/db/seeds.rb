# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create!(username: "Satoshi")
user2 = User.create!(username: "Josep")
artwork1 = Artwork.create!(title: "Genesis Block", image_url: "google.com", artist_id: user1.id)
artwork2 = Artwork.create!(title: "Sun and Field", image_url: "pinterest.com", artist_id: user2.id)
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)
comment1 = Comment.create!(body: 'A step towards the future!', user_id: user1.id, artwork_id: artwork1.id)
comment2 = Comment.create!(body: 'A leap to feel the present!', user_id: user2.id, artwork_id: artwork2.id)