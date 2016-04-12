# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = User.new
a.email ="user@gmail.com"
a.password = "password"
a.save

# /////////////////////////////////////////////////

b = Cat.new
b.user_id = a.id
b.name = "Moo"
b.photo = "http://lorempixel.com/g/400/400/cats/"
b.likes = 5
b.save

c = Cat.new
c.user_id = a.id
c.name = "Clem"
c.photo = "http://lorempixel.com/g/400/400/cats/"
c.likes = 5
c.save

d = Cat.new
d.user_id = a.id
d.name = "Gita"
d.photo = "http://lorempixel.com/g/400/400/cats/"
d.likes = 5
d.save

e = Cat.new
e.user_id = a.id
e.name = "Kitten"
e.photo = "http://lorempixel.com/g/400/400/cats/"
e.likes = 5
e.save

f = Cat.new
f.user_id = a.id
f.name = "Gracey"
f.photo = "http://lorempixel.com/g/400/400/cats/"
f.likes = 5
f.save

g = Cat.new
g.user_id = a.id
g.name = "Boomba"
g.photo = "http://lorempixel.com/g/400/400/cats/"
g.likes = 5
g.save


# /////////////////////////////////////////////////

h = Favorite.new
h.cat_id = b.id
h.thing = "boxes"
h.save

i = Favorite.new
i.cat_id = c.id
i.thing = "string"
i.save

j = Favorite.new
j.cat_id = d.id
j.thing = "feathers"
j.save

k = Favorite.new
k.cat_id = e.id
k.thing = "boxes"
k.save

l = Favorite.new
l.cat_id = f.id
l.thing = "bugs"
l.save

m = Favorite.new
m.cat_id = g.id
m.thing = "peeing"
m.save
# /////////////////////////////////////////////////


