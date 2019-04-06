require_relative( 'models/customer.rb' )
require_relative( 'models/film.rb' )
require_relative( 'models/ticket.rb' )

require( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


film1 = Film.new({'title' => 'Toy Story 4', 'price' => '9'})
film1.save()
film2 = Film.new({'title' => 'Avengers: End Game', 'price' => '12'})
film2.save()
film3 = Film.new({'title' => 'Zombieland: Double Tap', 'price' => '10'})
film3.save()


customer1 = Customer.new({'name' => 'David', 'funds' => '40'})
customer1.save()
customer2 = Customer.new({'name' => 'Beth', 'funds' => '50'})
customer2.save()
customer3 = Customer.new({'name' => 'Nicola', 'funds' => '30'})
customer3.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket5.save()





binding.pry
nil
