require './modules/date_handler'
class Audit
  include DateHandler
  attr_reader :companies

  def initialize
    @companies = []
  end

  def load_company(company)
    @companies << company
  end

  def timesheets
    @companies.map {|company| company.timesheets}.flatten
  end

  def were_invalid_days_worked
    timesheet_is_invalid
  end

  def timesheet_is_invalid
    timesheets.each do |timesheet|
      date = timesheet.date
      date.date_between(company.projects.start_date,
                        company.projects.end_date)
      end
  end
end
