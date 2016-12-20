# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#10.times { FactoryGirl.create(:user) }

soup = Food.create(kind: 'soup', title: 'default_soup', image: File.open(Rails.root + "app/assets/images/browse_soup.jpeg"))
salad = Food.create(kind: 'salad', title: 'default_salad', image: File.open(Rails.root + "app/assets/images/browse_salad.jpeg"))