# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
u1 = User.create :first_name => "Joe", :last_name => "Bloggs", :email => "joebloggs@gmail.com", :password => "Password123", :address_num => "20", :address_street => "William St", :address_suburb => "Woolloomooloo", :address_city => "Sydney", :address_country => "Australia", :address_postcode => "2011", :phone => "0400222444", :latitude => nil, :longitude => nil, :can_post => true, :admin => false

u2 = User.create :first_name => "Bill", :last_name => "Blanks", :email => "billblanks@gmail.com", :password => "Password456", :address_num => "140", :address_street => "Liverpool St", :address_suburb => "Surry Hills", :address_city => "Sydney", :address_country => "Australia", :address_postcode => "2010", :phone => "0401111111", :latitude => nil, :longitude => nil, :can_post => true, :admin => false

puts "#{ User.count } users"


Job.destroy_all

j1 = Job.create :title => "Garden Clean Up", :desc => "I need someone to spend 2 hours tidying up my front and back yard. Will pay $100", :price => 100, :image_1 => "http://placekitten.com/g/200/300"

j2 = Job.create :title => "Lawn Mowing", :desc => "Some easy Lawn Mowing. Should only take 45 minutes. Will pay $70", :price => 70, :image_1 => "http://placekitten.com/g/200/300"

j3 = Job.create :title => "Weeding", :desc => "I've got lots of weeds in my front yard. Please can you remove them?", :price => 120, :image_1 => "http://placekitten.com/g/200/300", :image_2 => "http://placekitten.com/g/200/300", :image_3 => "http://placekitten.com/g/200/300"

puts "#{ Job.count } jobs"

Comment.destroy_all

c1 = Comment.create :comment => "I'd be interested in doing this job. Would you take $20 less?"

c2 = Comment.create :comment => "How big is the yard area?"

c3 = Comment.create :comment => "I'm busy for the next week but could do it after then?"

puts "#{ Comment.count } comments"

Category.destroy_all

t1 = Category.create :name => "Lawn mowing/edging"
t2 = Category.create :name => "Yard tidy up"
t3 = Category.create :name => "Weeding"

puts "#{ Category.count } categories"








