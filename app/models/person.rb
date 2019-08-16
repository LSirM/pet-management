class Person < ApplicationRecord
  include Formatters::DateFormatter

  has_many :animals

  def convert_to_date(date)
    Formatters::DateFormatter.convert_brazilian_date_to_default(date)
  end

  def age
    (Date.today.year - self.dt_birth.year)
  end

  def name_begins_with?(letter)
    (self.name.split('').first == letter)
  end
end
