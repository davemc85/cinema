require_relative('../db/sql_runner.rb')
require_relative('film.rb')
require_relative('ticket.rb')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()   # eg customer1.films
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |film| Film.new(film)}
  end


  # select tickets bought by customer using id

  def tickets()    # customer1.tickets
    sql = "SELECT * FROM tickets WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|ticket| Ticket.new(ticket)}
  end


# customer1.number_of_tickets() - number of tickets bought by specific customer

  def number_of_tickets()
    return tickets.length()
  end


  def ticket_purchase(film)
    @funds -= film.price
    return @funds
  end




end
