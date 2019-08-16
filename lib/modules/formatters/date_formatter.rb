module Formatters
  module DateFormatter

    def self.convert_brazilian_date_to_default(date)
      date.gsub!('de ', '')
      date = date.split(' ')
      date[1] = I18n.t('date.month_names').find_index(date[1])
      date.collect!(&:to_i)
      converted_date = DateTime.new(date[2], date[1], date[0])
      converted_date
    end
  end
end