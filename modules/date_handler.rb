require 'date'
#
module DateHandler
  require 'date'
  #
  class DHDate
    def initialize(initial_date)
      @date = initial_date
    end

    def date_between(start_date, end_date)
      # returns a true/false if @date falls between two other Date object values
      @date >= start_date && @date <= end_date
    end
  end

  def self.days_between(start_date, end_date)
    # returns the number of days between two Date object values
    (end_date - start_date).to_i
  end

  def self.minutes_conversion(minutes)
    # converts an Integer of minutes into a hash of hours and minutes
    hours = minutes / 60
    minutes_leftover = minutes - (hours * 60)
    { hours: hours, minutes: minutes_leftover }
  end

  def self.string_to_date(date_string)
    # splits a string like '2018-02-01' into a Date object for that date
    date_bits = date_string.split('-')
    Date.new(
      date_bits[0].to_i,
      date_bits[1].to_i,
      date_bits[2].to_i
    )
  end

  def find_date(date)
    DateHandler.string_to_date(date)
  end
end
