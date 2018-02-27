require 'CSV'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
    @loading = {success: true, error: nil}
  end

  def check_data(filename)
    data = CSV.read(filename)
    data.flatten.include?(nil)
  end

  def load_employees(filename)
    if check_data(filename) == false
      insert_employees(filename)
    else
      @loading = {success: false,
                   error: 'bad data'}
    end
  @loading
  end

  def insert_employees(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |data|
      @employees << Employee.new(data)
    end
  end

  def load_projects(filename)
    if check_data(filename) == false
      insert_projects(filename)
    else
      @loading = {success: false,
                   error: 'bad data'}
    end
    @loading
  end

  def insert_projects(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |data|
      @projects << Project.new(data)
    end
  end

  def load_timesheets(filename)
    if check_data(filename) == false
      insert_timesheets(filename)
    else
      @loading = {success: false,
                   error: 'bad data'}
    end
    @loading
  end

  def insert_timesheets(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |data|
      @timesheets << Timesheet.new(data)
    end
  end

  def find_employee_by_id(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_project_by_id(id)
    @projects.find do |project|
      project.id == id
    end
  end
end
