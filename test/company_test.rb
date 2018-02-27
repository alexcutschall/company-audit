require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def test_it_exists
    company = Company.new
    assert_instance_of Company, company
  end

  def test_it_has_attributes
    company = Company.new
    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_can_load_employees
    company = Company.new
    assert company.employees.empty?

    employees = company.load_employees('./data/employees.csv')

    refute company.employees.empty?
    assert_equal 1, company.employees.first.id
  end

  def test_it_can_deal_with_bad_data
    company = Company.new

    employees = company.load_employees('./data/bad_employees.csv')

    assert_instance_of Hash, employees
    assert company.employees.empty?
  end

  def test_can_load_projects
    company = Company.new
    assert company.projects.empty?

    projects = company.load_projects('./data/projects.csv')

    assert_instance_of Hash, projects
    assert_equal 1, company.projects.first.id
    refute company.projects.empty?
  end

  def test_can_deal_with_bad_project_data
    company = Company.new
    assert company.projects.empty?

    projects = company.load_projects('./data/bad_projects.csv')

    assert_instance_of Hash, projects
    assert company.projects.empty?
  end

  def test_can_load_timesheets
    company = Company.new
    assert company.timesheets.empty?

    timesheets = company.load_timesheets('./data/good_timesheets.csv')

    assert_instance_of Hash, timesheets
    refute company.timesheets.empty?
  end

  def test_can_deal_with_bad_timesheet_data
    company = Company.new
    assert company.timesheets.empty?

    timesheets = company.load_timesheets('./data/bad_timesheets.csv')

    assert_instance_of Hash, timesheets
    assert company.projects.empty?
  end

  def test_can_find_employee_id
    company = Company.new

    company.load_employees('./data/employees.csv')
    employee = company.find_employee_by_id(1)
    employee_2 = company.find_employee_by_id(9992345)

    assert_instance_of Employee, employee
    assert_equal 1, employee.id
    assert_equal "Susan Smith", employee.name
    assert_nil employee_2
  end

  def test_can_find_project_id
    company = Company.new

    company.load_projects('./data/projects.csv')
    project = company.find_project_by_id(1)
    project_2 = company.find_employee_by_id(9992345)

    assert_instance_of Project, project
    assert_equal 1, project.id
    assert_equal "Widgets", project.name
    assert_nil project_2
  end
end
