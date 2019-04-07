require_relative( 'models/customer.rb' )
require_relative( 'models/film.rb' )
require_relative( 'models/ticket.rb' )
require_relative( 'models/screening.rb')

require( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()


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


screening1 = Screening.new({'film_id' => film1.id, 'time' => '13:00'})
screening1.save
screening2 = Screening.new({'film_id' => film1.id, 'time' => '17:00'})
screening2.save
screening3 = Screening.new({'film_id' => film1.id, 'time' => '21:00'})
screening3.save
screening4 = Screening.new({'film_id' => film2.id, 'time' => '16:30'})
screening4.save
screening5 = Screening.new({'film_id' => film2.id, 'time' => '20:30'})
screening5.save
screening6 = Screening.new({'film_id' => film3.id, 'time' => '15:00'})
screening6.save
screening7 = Screening.new({'film_id' => film3.id, 'time' => '19:30'})
screening7.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening6.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening4.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening5.id})
ticket5.save()



binding.pry
nil
