class Person < ApplicationRecord
  include Formatters::DateFormatter
  attr_accessor :dt_of_birth
  has_many :animals
  before_save :convert_to_date

  def age
    (Date.today.year - self.dt_birth.year)
  end

  def name_begins_with?(letter)
    (self.name.split('').first == letter)
  end

  def animals_total_cost
    self.animals.sum(&:monthly_cost)
  end

  private

    def convert_to_date
      return true if !self.dt_birth.is_a?(String)
      self.dt_birth = Formatters::DateFormatter.convert_brazilian_date_to_default(date)
    end
end
