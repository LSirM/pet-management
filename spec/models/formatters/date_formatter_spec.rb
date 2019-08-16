require 'rails_helper'
require 'modules/formatters/date_formatter'

describe Formatters::DateFormatter do
  let(:date){ Faker::Date.birthday(min_age: 1, max_age: 65) }
  let(:brazilian_long_date){ I18n.l(date, format: :long) }

  it 'should convert brazilian long string date to default DateTime' do
    converted_format = Formatters::DateFormatter.convert_brazilian_date_to_default(brazilian_long_date)
    expect(converted_format.class).to eq(DateTime)
  end
end
