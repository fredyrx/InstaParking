# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

distritos = District.create(
    [
        {'description':'Barranco','photo':'https://www.parkingpanda.com/cdn/images/seo/banners/city-header-san-francisco.png;format=jpg;w=300;h=300;mode=crop;quality=85'},
        {'description':'Miraflores','photo':'https://www.parkingpanda.com/cdn/images/seo/banners/city-header-new-orleans.png;format=jpg;w=300;h=300;mode=crop;quality=85'},
        {'description':'Surco','photo':'https://www.parkingpanda.com/cdn/images/seo/banners/city-header-new-york.png;format=jpg;w=300;h=300;mode=crop;quality=85'},
        {'description':'San borja','photo':'https://www.parkingpanda.com/cdn/images/seo/banners/city-header-atlanta.png;format=jpg;w=300;h=300;mode=crop;quality=85'}
    ]
)

User.create(
    [
        {'name': 'admin', 'email':'admin@instaparking.com','lastname':'sistemas','password': '123456'}
    ]
    )