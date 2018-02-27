require './test/test_helper'
require './lib/audit'
require './lib/company'

class AuditTest < Minitest::Test
  def setup
    @company = Company.new
    @company.load_projects('./data/projects.csv')
    @company.load_employees('./data/employees.csv')
    @company.load_timesheets('./data/good_timesheets.csv')
    @audit = Audit.new
    @audit.load_company(@company)
  end

  def test_it_exists
    audit = Audit.new
    assert_instance_of Audit, audit
  end

  def test_can_load_company
    audit = Audit.new
    audit.load_company(@company)

    assert_instance_of Company, audit.companies.first
    assert_equal @company, audit.companies.first
  end

  def test_can_find_if_timesheet_is_outside_dates
    skip
  end

  def test_can_find_if_there_were_invalid_days_worked
    skip
    assert_equal "There were no invalid days", @audit.were_invalid_days_worked
  end
end
