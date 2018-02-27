require './modules/date_handler'

class Employee
  include DateHandler

  attr_reader :id,
              :name,
              :role,
              :start_date,
              :end_date

  def initialize(data)
    @id          = data[:employee_id].to_i
    @name        = data[:name]
    @role        = data[:role]
    @start_date  = find_date(data[:start_date])
    @end_date    = find_date(data[:end_date])
  end
end
