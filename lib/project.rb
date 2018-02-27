class Project
  include DateHandler

  attr_reader :id,
              :name,
              :start_date,
              :end_date

  def initialize(data)
    @id         = data[:project_id].to_i
    @name       = data[:name]
    @start_date = find_date(data[:start_date])
    @end_date   = find_date(data[:end_date])
  end
end
