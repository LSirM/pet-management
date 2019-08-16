class Person < ApplicationRecord
  include Formatters::DateFormatter

  has_many :animals

  def convert_to_date(date)
    Formatters::DateFormatter.convert_brazilian_date_to_default(date)
  end
end
