require_relative('../db/sql_runner.rb')
require_relative('customer.rb')
require_relative('ticket.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = (options)['title']
    @price = (options)['price'].to_i
  end


  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    customer = SqlRunner.run(sql,values)[0]
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title, price) =  ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers()   # eg film1.customers
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer)}
  end


# select tickets bought for films using id

  def tickets()    # film1.tickets
    sql = "SELECT * FROM tickets WHERE film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|ticket| Ticket.new(ticket)}
  end

  # film1.number_of_tickets() - number of tickets sold for a specific film

  def number_of_tickets()
    return tickets.length()
  end

end
