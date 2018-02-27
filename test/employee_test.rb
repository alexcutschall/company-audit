require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def setup
    data = {employee_id: '5',
            name:        'Sally Jackson',
            role:        'Engineer',
            start_date:  '2015-01-01',
            end_date:    '2018-01-01'}

  @employee = Employee.new(data)
  end

  def test_instantiation
    assert_instance_of Employee, @employee
  end

  def test_attributes
    assert_equal 5, @employee.id
    assert_equal 'Sally Jackson', @employee.name
    assert_equal 'Engineer', @employee.role
    assert_instance_of Date, @employee.start_date
    assert_instance_of Date, @employee.end_date
  end
end
