require_relative('../db/sql_runner.rb')
require_relative('film.rb')

class Screening

  attr_reader :id
  attr_accessor :film_id, :time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @time = options['time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, time) VALUES ($1, $2) RETURNING id"
    values = [@film_id, @time]
    screening = SqlRunner.run(sql, values)[0]
    @id = screening['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    values = []
    screenings = SqlRunner.run(sql, values)
    result = screenings.map { |screening| Screening.new( screening ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end


  def customers()   # eg screening1.customers
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.screening_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer)}
  end



  def number_of_customers
    return customers.length
  end


end
