require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test
  def setup
    data = {project_id: '123',
            name:        'Widget Maker',
            start_date:  '2015-01-01',
            end_date:    '2018-01-01'}
    @project = Project.new(data)
  end

  def test_it_exists
    assert_instance_of Project, @project
  end

  def test_it_has_attributes
    assert_equal 123, @project.id
    assert_equal 'Widget Maker', @project.name
    assert_instance_of Date, @project.start_date
    assert_instance_of Date, @project.end_date
  end

end
